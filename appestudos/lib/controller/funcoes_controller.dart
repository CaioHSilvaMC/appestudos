import 'package:appestudos/model/perguntas_model.dart';
import 'package:flutter/material.dart';

class FuncoesController extends ChangeNotifier{
  final List<Perguntas> _perguntas = [
    Perguntas(
      pergunta: '',
      opcoes: ['10.000 L', '20.000 L', '30.000 L', '40.000 L'],
      resposta: '40.000 L',
    ),
    Perguntas(
      pergunta: '',
      opcoes: ['2 min', '3 min', '4 min', '5 min'],
      resposta: '5 min',
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