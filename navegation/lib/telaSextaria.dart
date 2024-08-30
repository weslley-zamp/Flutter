import 'package:flutter/material.dart';

class TelaSextaria extends StatefulWidget {
  @override
  _TelaSextariaState createState() => _TelaSextariaState();
}

class _TelaSextariaState extends State<TelaSextaria>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Sextaria"),
        backgroundColor: const Color.fromARGB(255, 248, 76, 2),
      ),
      body: const Center(
          child: DialogExample(),
        ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('E de peixe?'),
          content: const Text('Tu é doidooo!!!!!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancelar'),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Gosto'),
              child: const Text('Gosto'),
            ),
          ],
        ),
      ),
      child: const Text('Mostrar mensagem'),
    );
  }
}