import 'package:appestudos/model/perguntas_model.dart';
import 'package:flutter/material.dart';

class GeoespacialController extends ChangeNotifier{
  final List<Perguntas> _perguntas = [
    Perguntas(
      pergunta: 'Qual o volume e a área superficial total de um paralelepípedo reto com dimensões de 5 cm, 7 cm e 9 cm?',
      opcoes: ['Volume 63 cm³ e área 143 cm²', 
               'Volume 315 cm³ e área 286 cm²', 
               'Volume 315 cm² e área 286 cm³', 
               'Volume 620 cm³ e área 572 cm²'],
      resposta: 'Volume 315 cm³ e área 286 cm²',
    ),
    Perguntas(
      pergunta: 'Calcule o volume de uma esfera com 3 cm de raio. Considere pi como 3,14.',
      opcoes: ['15,46 cm³', '16,12 cm³', '28,18 cm³', '37,68 cm³'],
      resposta: '37,68 cm³',
    ),
  ];

  bool _finalizado = false;

  List<Perguntas> get perguntas => _perguntas;
  bool get finalizado => _finalizado;

  void responder(int index, String respostaSelecionada) {
    if (_finalizado) return; 
    _perguntas[index].respostaSelecionada = respostaSelecionada;
    notifyListeners();
  }

  void finalizarQuiz() {
    _finalizado = true;
    notifyListeners();
  }

  int get totalAcertos => _perguntas.where((p) => p.acertou).length;
}
