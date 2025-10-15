import 'package:appestudos/model/perguntas_model.dart';
import 'package:flutter/material.dart';

class GrandezasController extends ChangeNotifier {
  final List<Perguntas> _perguntas = [
    Perguntas(
      pergunta: 'Pedro tem uma piscina em sua casa que mede 6 m de comprimento e comporta 30 000 litros de água. Seu irmão Antônio decide também construir uma piscina com a mesma largura e profundidade, mas com 8 m de comprimento. Quantos litros de água cabem na piscina de Antônio?',
      opcoes: ['10.000 L', '20.000 L', '30.000 L', '40.000 L'],
      resposta: '40.000 L',
    ),
    Perguntas(
      pergunta: 'Em uma lanchonete, seu Alcides prepara suco de morango todos os dias. Em 10 minutos e utilizando 4 liquidificadores, a lanchonete consegue preparar os sucos que os clientes pedem. Para diminuir o tempo de preparo, seu Alcides dobrou o número de liquidificadores. Quanto tempo levou para que os sucos ficassem prontos com os 8 liquidificadores funcionando?',
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
