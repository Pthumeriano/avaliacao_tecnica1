import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controladorEntrada = TextEditingController();
  int resultado = 0;

  void calcular(){
    setState(() {
      int entrada = int.parse(controladorEntrada.text);
      
      for(int i=1; i<entrada; i++){
        if(i%3==0 || i%5==0){
          resultado += i;
        }
      }

    });
  }

  void mostrarResultado(BuildContext context){

    resultado = 0;

    calcular();

    Widget ok = ElevatedButton(onPressed: () => Navigator.of(context).pop(),style: ElevatedButton.styleFrom(primary: Colors.green), child: const Text("Ok!"));

    AlertDialog alerta = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.all(20),
      title: Text("Resultado: ${resultado.toString()}"),
      alignment: Alignment.center,
      actions: [
        ok
      ],
    );

    showDialog(context: context, builder: (BuildContext context){
      return alerta;
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Avaliação técnica 1", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,

      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Padding(padding: const EdgeInsets.all(50),
            child: 
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Digite um número inteiro"),
              textAlign: TextAlign.center,
              controller: controladorEntrada,
            
            ),
          
          ),
        
          
          Padding(padding: const EdgeInsets.all(275),
            child: ElevatedButton(onPressed: () => mostrarResultado(context), style: ElevatedButton.styleFrom(primary: Colors.green), child: const Text("Calcular"),) 
          )


        ],
      ),

    );
  }


}
