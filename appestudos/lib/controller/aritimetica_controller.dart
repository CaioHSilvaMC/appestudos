import 'package:appestudos/model/perguntas_model.dart';
import 'package:flutter/material.dart';

class AritimeticaController extends ChangeNotifier{
  final List<Perguntas> _perguntas = [
    Perguntas(
      pergunta: 'Uma empresa precisa distribuir 2400 folhetos igualmente entre 8 funcionários. Quantos folhetos cada funcionário receberá?',
      opcoes: ['200', '250', '300', '350'],
      resposta: '300',
    ),
    Perguntas(
      pergunta: 'Em uma promoção, um supermercado vende pacotes de arroz com 25% de desconto. Se o preço original de um pacote de arroz é 48 reais, qual será o preço com o desconto?',
      opcoes: ['34 Reais', '36 Reais', '38 Reais', '40 Reais'],
      resposta: '36 Reais',
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