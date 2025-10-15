class Perguntas {
  final String pergunta;
  final List<String> opcoes;
  final String resposta; 
  String? respostaSelecionada;

  Perguntas({
    required this.pergunta,
    required this.opcoes,
    required this.resposta,
    this.respostaSelecionada,
  });

  bool get foiRespondida => respostaSelecionada != null;
  bool get acertou => respostaSelecionada == resposta;
}

