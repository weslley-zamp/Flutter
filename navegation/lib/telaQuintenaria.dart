import 'package:flutter/material.dart';

class TelaQuintenaria extends StatefulWidget {
  @override
  _TelaQuintenariaState createState() => _TelaQuintenariaState();
}

class _TelaQuintenariaState extends State<TelaQuintenaria> {
  @override
  Widget build(BuildContext context) {
    // Obter o ColorScheme do tema atual
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Quintenaria"),
        backgroundColor: const Color.fromARGB(255, 228, 4, 191),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Mapeamento de cores Surface
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FloatingActionButton.large(
                  foregroundColor: colorScheme.primary,
                  backgroundColor: colorScheme.surface,
                  onPressed: () {
                    // Adicione seu código aqui!
                  },
                  child: const Icon(Icons.edit_outlined),
                ),
                const SizedBox(height: 20),
                titleBox('Voce'),
              ],
            ),
            // Mapeamento de cores Secondary
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FloatingActionButton.large(
                  foregroundColor: colorScheme.onSecondaryContainer,
                  backgroundColor: colorScheme.secondaryContainer,
                  onPressed: () {
                    // Adicione seu código aqui!
                  },
                  child: const Icon(Icons.edit_outlined),
                ),
                const SizedBox(height: 20),
                titleBox('Gosta'),
              ],
            ),
            // Mapeamento de cores Tertiary
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FloatingActionButton.large(
                  foregroundColor: colorScheme.onTertiaryContainer,
                  backgroundColor: colorScheme.tertiaryContainer,
                  onPressed: () {
                    // Adicione seu código aqui!
                  },
                  child: const Icon(Icons.edit_outlined),
                ),
                const SizedBox(height: 20),
                titleBox('De farinha?'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Função auxiliar para criar o título abaixo dos botões
  Widget titleBox(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
