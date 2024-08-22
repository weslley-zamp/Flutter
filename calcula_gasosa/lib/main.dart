import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraCombustivelApp());
}

class CalculadoraCombustivelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

      if (precoAlcool == null || precoGasolina == null) {
        resultado = "Por favor, insira valores válidos.";
      } else {
        double razao = precoAlcool / precoGasolina;
        if (razao < 0.7) {
          resultado = "Abasteça com Álcool";
        } else {
          resultado = "Abasteça com Gasolina";
        }
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
          children: [
            TextField(
              controller: precoAlcoolController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Preço do Álcool"),
            ),
            TextField(
              controller: precoGasolinaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Preço da Gasolina"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  child: Text("Calcular"),
                ),
                ElevatedButton(
                  onPressed: limparCampos,
                  child: Text("Limpar"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(resultado, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
