import 'package:appestudos/controller/app_controller.dart';
import 'package:appestudos/view/grandezas_view.dart';
import 'package:appestudos/view/probabilidade_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuView();
}

class _MenuView extends State<MenuView> {
  final AppController ctrl = GetIt.I.get<AppController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bem Vindo ${ctrl.email}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: visualizarGrid(),
      ),
    );
  }

  Widget visualizarGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2, 
      ),
      itemCount: ctrl.materias.length,
      itemBuilder: (context, index) {
        final item = ctrl.materias[index];
        return GestureDetector(
          onTap: () {
            switch (item.nome) {
              case 'Grandezas Proporcionais':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GrandezasView()),
                );
              break;

              case 'Probabilidade':
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ProbabilidadeView()),
                );
              break;
            }
          },
          child: Card(
            elevation: 4,
            color: Colors.blue[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                item.nome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
