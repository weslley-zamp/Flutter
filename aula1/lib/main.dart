import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget //classe que representa o aplicativo
{
  Widget build(BuildContext context) //constroi a interface do app
  {
    return MaterialApp //tipo do layout
    (
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget
{
  _HomeState createState()=> _HomeState(); //Cria um estado para a tela inicial
}

class _HomeState extends State<Home> //Classe que representa o estado
{
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  String _resultado = "Informe seus dados!";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _limparCampos(){
    _pesoController.text = "";
    _alturaController.text = "";
     setState(() {
    _resultado = "Informe seus dados!";
  }, );
  }

  void _calcular (){
    double peso = double.parse(_pesoController.text);
    double altura = double.parse(_alturaController.text);

    double imc = peso/(altura * altura);

    setState((){
      if(imc < 18.6){
        _resultado = "Abaixo do peso, seu imc é: (${imc.toStringAsPrecision(3)})";
      } else if(imc >= 18.6 && imc <24.9){
        _resultado = "Peso ideal (${imc.toStringAsPrecision(3)})";
      } else if(imc >= 24.9 && imc < 29.9){
        _resultado = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 29.9 && imc <34.9){
        _resultado = "Obesidade de Grau I (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 34.9 && imc <39.9){
        _resultado = "Obseidade de Grau II (${imc.toStringAsPrecision(3)})";
      }else{
        _resultado = "Obesidade de Grau III (${imc.toStringAsPrecision(3)})";
      }
    },);
  }
 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( //barra de titulo da tela
        title:Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 102, 242, 107),
        actions: <Widget>[
          IconButton(onPressed: _limparCampos , icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_2_outlined, size: 120.0, color:Colors.lightGreen),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso(kg)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
                controller: _pesoController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration:InputDecoration(
                  labelText: "Altura(cm)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
                controller: _alturaController,
                validator:(value){
                  if(value == null || value.isEmpty){
                    return "Insira sua alutra";
                  }
                }
              ),
              Padding(
                padding:EdgeInsets.only(top:10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()) //Verifica se o formulario é valido
                      {
                        _calcular();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
              
                ),
              ),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              ),
            ],
          )
        )
      ),
    );
  }

}