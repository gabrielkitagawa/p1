import 'package:flutter/material.dart';

class CarrinhoView extends StatefulWidget {
  
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoView();
}

var formKey = GlobalKey<FormState>();

//Controladores dos Campos de Texto
//var email = TextEditingController();
//var senha = TextEditingController();

class _CarrinhoView extends State<CarrinhoView> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CARRINHO',
          style: TextStyle(color: Colors.white), // Letras brancas
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
           body: Padding(
        padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: []
          )))
      );
  }
}