import 'package:appestudos/controller/app_controller.dart';
import 'package:appestudos/controller/funcoes_controller.dart';
import 'package:appestudos/controller/grandezas_controller.dart';
import 'package:appestudos/controller/probabilidade_controller.dart';
import 'package:appestudos/view/login_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<AppController>(AppController());
  getIt.registerSingleton<GrandezasController>(GrandezasController());
  getIt.registerSingleton<FuncoesController>(FuncoesController());
  getIt.registerSingleton<ProbabilidadeController>(ProbabilidadeController());
  

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login',
      home: LoginView()
    );
  }
}
