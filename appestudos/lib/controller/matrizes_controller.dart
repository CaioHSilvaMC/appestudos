import 'package:appestudos/model/perguntas_model.dart';
import 'package:flutter/material.dart';

class MatrizesController extends ChangeNotifier{
  final List<Perguntas> _perguntas = [
    Perguntas(
      pergunta: 'O valor do determinante da matriz é:',
      opcoes: ['14', '-14', '16', '-16'],
      resposta: '-14',
    ),
    Perguntas(
      pergunta: 'O determinante dessa matriz é igual a:',
      opcoes: ['15', '20', '25', '30'],
      resposta: '25',
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
