import 'package:appestudos/controller/probabilidade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProbabilidadeView extends StatefulWidget {
  const ProbabilidadeView({super.key});

  @override
  State<ProbabilidadeView> createState() => _ProbabilidadeView();
}

class _ProbabilidadeView extends State<ProbabilidadeView> {
  final ProbabilidadeController ctrl = GetIt.I.get<ProbabilidadeController>();
  late final VoidCallback listener;

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    ctrl.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
          'Probabilidade',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ctrl.perguntas.length,
                itemBuilder: (context, index) {
                  final pergunta = ctrl.perguntas[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Questão ${index + 1}:',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            pergunta.pergunta,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 10),
                          ...pergunta.opcoes.map((op) {
                            final selecionada =
                                pergunta.respostaSelecionada == op;
                            final correta = pergunta.resposta == op;

                            Color? cor;
                            if (ctrl.finalizado) {
                              if (correta) {
                                cor = Colors.green[200];
                              } else if (selecionada && !correta) {
                                cor = Colors.red[200];
                              }
                            } else if (selecionada) {
                              cor = Colors.blue[100];
                            }

                            return Card(
                              color: cor,
                              child: ListTile(
                                title: Text(op),
                                onTap: () {
                                  ctrl.responder(index, op);
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (!ctrl.finalizado) {
                  ctrl.finalizarQuiz();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Quiz finalizado! Você acertou ${ctrl.totalAcertos} de ${ctrl.perguntas.length} questões.',
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    ctrl.finalizado ? Colors.grey : Colors.blueAccent,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                ctrl.finalizado ? 'Finalizado' : 'Finalizar',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ]
        ),
      )
    );
  }
}
