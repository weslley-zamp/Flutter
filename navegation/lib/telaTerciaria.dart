import 'package:flutter/material.dart';

class TelaTerciaria extends StatefulWidget {
  @override
  _TelaTerciariaState createState() => _TelaTerciariaState();
}

class _TelaTerciariaState extends State<TelaTerciaria> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Terciaria"),
        backgroundColor: const Color.fromARGB(255, 56, 206, 61),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text("Tu é doido, indio japones"),
                subtitle: Text("Meme feito ao norte do Brasil"),
              ),
            
            ]
          ),
        ),
        )
        );
      }
  }
