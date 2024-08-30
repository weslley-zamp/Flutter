import 'package:flutter/material.dart';

class TelaQuartaria extends StatefulWidget {
  @override
  _TelaQuartariaState createState() => _TelaQuartariaState();
}

class _TelaQuartariaState extends State<TelaQuartaria> with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _sizeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);
    _sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_sizeController);

    // Inicia as animações automaticamente
    _fadeController.forward();
    _sizeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Quartaria"),
        backgroundColor: const Color.fromARGB(255, 253, 1, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Hero(
            tag: 'ListTile-Hero',
            child: Material(
              child: ListTile(
                title: const Text(' Dragon force é bom'),
                subtitle: const Text('Clique para dragonForce'),
                tileColor: Colors.cyan,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('Dragon force é muito bom mesmo')),
                        body: Center(
                          child: Hero(
                            tag: 'ListTile-Hero',
                            child: Material(
                              child: ListTile(
                                title: const Text('Você não acredita?'),
                                subtitle: const Text('Clique aqui para voltar'),
                                tileColor: Colors.blue[700],
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            child: const Material(
              child: ListTile(
                title: Text('Lista enviadada'),
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                selected: true,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Center(
              child: SizeTransition(
                sizeFactor: _sizeAnimation,
                axisAlignment: -1.0,
                child: const Material(
                  child: ListTile(
                    title: Text('Lista transistora'),
                    tileColor: Colors.red,
                    minVerticalPadding: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
