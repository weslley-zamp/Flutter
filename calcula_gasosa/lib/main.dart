import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraCombustivelApp());
}

class CalculadoraCombustivelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculadoraCombustivel(),
    );
  }
}

class CalculadoraCombustivel extends StatefulWidget {
  @override
  _CalculadoraCombustivelState createState() => _CalculadoraCombustivelState();
}

class _CalculadoraCombustivelState extends State<CalculadoraCombustivel> {
  TextEditingController precoAlcoolController = TextEditingController();
  TextEditingController precoGasolinaController = TextEditingController();
  String resultado = "";

  void calcular() {
    setState(() {
      double precoAlcool = double.parse(precoAlcoolController.text);
      double precoGasolina = double.parse(precoGasolinaController.text);

      double razao = precoAlcool / precoGasolina;
      if (razao < 0.7) {
        resultado = "Abasteça com Álcool";
      } else {
        resultado = "Abasteça com Gasolina";
      }
    });
  }

  void limparCampos() {
    setState(() {
      precoAlcoolController.clear();
      precoGasolinaController.clear();
      resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Combustível"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: precoAlcoolController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Preço do Álcool",
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: precoGasolinaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Preço da Gasolina",
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text("Calcular", style: TextStyle(fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: limparCampos,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Text("Limpar", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
