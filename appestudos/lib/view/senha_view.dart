import 'package:flutter/material.dart';

class SenhaView extends StatefulWidget {
  const SenhaView({super.key});

  @override
  State<SenhaView> createState() => _SenhaView();
}

class _SenhaView extends State<SenhaView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MathGo',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Card(
            color: Colors.blueAccent,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Recuperação de Senha',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 206, 232, 236),
                        ),
                    ),
                    SizedBox(height: 20),

                    Text(
                      'Informe seu email e um link será enviado para a recuperação de senha',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 206, 232, 236),
                        ),
                    ),
                    SizedBox(height: 20),

                    TextFormField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                        labelText: "Email",
                        hintText: 'Digite seu email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 206, 232, 236)), 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 206, 232, 236)), 
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Digite o email';
                          }
                        if (!value.contains("@")) {
                            return 'Digite um email válido';
                          }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Link enviado com sucesso!',
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.blueAccent,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(20),
                              duration: const Duration(seconds: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}