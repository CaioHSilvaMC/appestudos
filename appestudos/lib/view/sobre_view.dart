import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreView();
}

class _SobreView extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sobre o App',
          style: TextStyle(color: Colors.white),
          ),
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meu App de Estudos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Versão: 0.0.1',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Este aplicativo foi desenvolvido para ajudar estudantes a organizarem seus estudos de forma eficiente. Nessa fase, os estudantes podem testar seus conhecimentos em 5 matérias e ao longo das versões serão adicionadas novas áreas.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Autoria de Caio Henrique S. M. Campos\nPara contato use caiohsilvamc@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}