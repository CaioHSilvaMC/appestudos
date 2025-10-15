import 'package:appestudos/model/perguntas_model.dart';
import 'package:flutter/material.dart';

class ProbabilidadeController extends ChangeNotifier {
  final List<Perguntas> _perguntas = [
    Perguntas(
      pergunta: 'Um saco contém 8 bolas de mesmo tamanho, mas com cores diferentes: três azuis, quatro vermelhas e uma amarela. Retira-se ao acaso uma bola. Qual a probabilidade da bola retirada ser azul?',
      opcoes: ['20%', '37.5%', '55.5%', '60%'],
      resposta: '37.5%',
    ),
    Perguntas(
      pergunta: 'Sorteando-se um número de 1 a 20, qual a probabilidade de que esse número seja múltiplo de 2?',
      opcoes: ['10%', '50%', '70%', '80%'],
      resposta: '50%',
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
