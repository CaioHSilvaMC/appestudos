import 'package:appestudos/controller/app_controller.dart';
import 'package:appestudos/view/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroView();
}

class _CadastroView extends State<CadastroView> {
   final AppController ctrl = GetIt.I.get<AppController>();
   final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }
  
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
            color:  Colors.blueAccent,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cadastro',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 206, 232, 236),
                      ),
                    ),

                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) {
                        ctrl.cadastrarEmail(value);
                      },
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
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        ctrl.cadastrarSenha(value);
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                        labelText: "Senha",
                        hintText: 'Digite sua senha',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 206, 232, 236)), 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 206, 232, 236)), 
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite a senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                        labelText: "Confirme a Senha",
                        hintText: 'Confirme sua senha',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 206, 232, 236)), 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 206, 232, 236)), 
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirme a senha';
                        }
                        if (value != ctrl.senha) {
                          return 'Senhas não coincidem';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => MenuView())
                          );
                        }
                      }, 
                      child: Text('Entrar')
                    )
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
