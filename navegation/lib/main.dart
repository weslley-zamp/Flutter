import 'package:flutter/material.dart';
import 'package:navegation/telaQuartaria.dart';
import 'package:navegation/telaSecundaria.dart';
import 'package:navegation/telaSextaria.dart';
import 'package:navegation/telaTerciaria.dart';
import 'package:navegation/telaQuintenaria.dart';

void main() {
  runApp(
    MaterialApp(
      home: TelaPrincipal(),
    ),
  );
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaSecundaria()),
                );
              },
              child: Text("Ir para segunda tela"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaTerciaria()),
                );
              },
              child: Text("Ir para terceira tela"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaQuartaria()),
                );
              },
              child: Text("Ir para quarta tela"),
            ),  
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaQuintenaria()),
                );
              },
              child: Text("Ir para quinta tela"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaSextaria()),
                );
              },
              child: Text("Ir para sexta tela"),
            ),
          ],
        ),
      ),
    );
  }
}
