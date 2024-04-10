import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter_application_1/view/cadastro_view.dart';
import 'package:flutter_application_1/view/carrinho_view.dart';
import 'package:flutter_application_1/view/credencial_view.dart';
import 'package:flutter_application_1/view/loja_view.dart';
import 'package:flutter_application_1/view/resenhar_view.dart';
import 'view/login_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginView(),
        'cadastro': (context) => CadastroView(),
        'resenhar': (context) => ResenharView(),
        'credencial': (context) => CredencialView(),
        'loja': (context) => LojaView(),
        'carrinho': (context) => CarrinhoView(),
      },
    );
  }
}
