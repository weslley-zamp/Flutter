import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override  
  _JogoState createState() => _JogoState();     
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("assets/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  final Map<String, AssetImage> _opcoesImagens = {
    "pedra": AssetImage("assets/pedra.png"),
    "papel": AssetImage("assets/papel.png"),
    "tesoura": AssetImage("assets/tesoura.png"),
  };

  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3); // Gerando numero aleatório entre 0 e 2
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuario: " + escolhaUsuario);

    setState(() {
      _imagemApp = _opcoesImagens[escolhaApp]!;
    });

    if (
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        _mensagem = "Parabéns você ganhou  :)";
      });
    } else if (
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ) {
      setState(() {
        _mensagem = "Você perdeu :(";
      });
    } else {
      setState(() {
        _mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo do Pedra, Papel e Tesoura"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("assets/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("assets/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("assets/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }

}
