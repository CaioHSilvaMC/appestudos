import 'package:appestudos/controller/app_controller.dart';
import 'package:appestudos/view/cadastro_view.dart';
import 'package:appestudos/view/menu_view.dart';
import 'package:appestudos/view/senha_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AppController ctrl = GetIt.I.get<AppController>();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MathGo',
          style: TextStyle(color: Colors.white),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 206, 232, 236),
                    ),
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
                      labelText: "Email",
                      hintText: 'Digite seu email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                      ),
                    ),
                    onChanged: (value) => ctrl.cadastrarEmail(value),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    obscureText: _obscureText,
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
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 232, 236),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                          _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        tooltip: _obscureText ? 'Mostrar senha' : 'Ocultar senha',
                      ),
                    ),
                    onChanged: (value) => ctrl.cadastrarSenha(value),
                  ),
                  SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const SenhaView(),
                        ),
                      );
                    },
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 206, 232, 236),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroView(),
                        ),
                      );
                    },
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 206, 232, 236),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      final mensagemErro =
                          ctrl.validarLogin(ctrl.email, ctrl.senha);

                      if (mensagemErro != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(mensagemErro)),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuView(),
                          ),
                        );
                      }
                    },
                    child: const Text('Entrar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
