import 'package:appestudos/model/materias_model.dart';
import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  String _email = '';
  String _senha = '';

  final List<String> _emailsCadastrados = ['teste@email.com'];
  final List<Materias> _materias = [
    Materias(nome: 'Grandezas Proporcionais'),
    Materias(nome: 'Estatística'),
    Materias(nome: 'Aritimética'),
    Materias(nome: 'Geometria Plana'),
    Materias(nome: 'Geometria Espacial'),
    Materias(nome: 'Funções e Equações'),
    Materias(nome: 'Probalidade'),
    Materias(nome: 'Combanitária'),
    Materias(nome: 'Matrizes'),
    Materias(nome: 'Trigonometria'),
  ];

  String get email => _email;
  String get senha => _senha;
  List<Materias> get materias => _materias;

  Widget? get visualizarLista => null;

  void cadastrarEmail(String novoEmail) {
    _email = novoEmail;
  }

  void cadastrarSenha(String novaSenha) {
    _senha = novaSenha;
  }

  String? validarLogin(String emailDigitado, String senhaDigitada) {
    if (!_emailsCadastrados.contains(emailDigitado)) {
      return 'Email não cadastrado';
    }

    if (emailDigitado == _email && senhaDigitada == _senha) {
      return null; 
    } else {
      return 'Senha incorreta';
    }
  }
}