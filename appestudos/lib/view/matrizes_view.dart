import 'package:appestudos/controller/matrizes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MatrizesView extends StatefulWidget {
  const MatrizesView({super.key});

  @override
  State<MatrizesView> createState() => _MatrizesView();
}

class _MatrizesView extends State<MatrizesView> {
  final MatrizesController ctrl = GetIt.I.get<MatrizesController>();
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
          'Matrizes',
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

                  String? imagem;
                  if (index == 0) imagem = 'images/ex1_matriz.png';
                  if (index == 1) imagem = 'images/ex2_matriz.png';

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
                          if (imagem != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              child: Image.asset(
                                imagem,
                                width: 250,
                                height: 250,
                                fit: BoxFit.contain,
                              ),
                            ),
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
                }else{
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    ctrl.finalizado ? Colors.grey: Colors.blueAccent,
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
