import 'package:appestudos/controller/app_controller.dart';
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
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: visualizarLista(),
      ),
    );
  }

  Widget visualizarLista() {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: ctrl.materias.length,
        itemBuilder: (context, index) {final item = ctrl.materias[index];
          return SizedBox(
            width: 150,
            child: Card(
              child: ListTile(
                title: Text(item.nome),
              ),
            ),
          );
        },
      )
    );
  }
}
