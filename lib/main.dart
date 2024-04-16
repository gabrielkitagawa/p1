import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_application_1/view/cadastro_view.dart';
import 'package:flutter_application_1/view/carrinho_view.dart';
import 'package:flutter_application_1/view/credencial_view.dart';
import 'package:flutter_application_1/view/lista1_view.dart';
import 'package:flutter_application_1/view/lista2_view.dart';
import 'package:flutter_application_1/view/lista3_view.dart';
import 'package:flutter_application_1/view/lista_view.dart';
import 'package:flutter_application_1/view/novalista_view.dart';
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
        'lista': (context) => ListaView(),
        'carrinho': (context) => CarrinhoView(),
        'novalista': (context) => NovalistaView(),
        'lista1': (context) => Lista1View(),
        'lista3': (context) => Lista3View(),
        'lista2': (context) => Lista2View(),
      },
    );
  }
}
