import 'package:flutter/material.dart';

class CredencialView extends StatefulWidget {
  const CredencialView({super.key});

  @override
  State<CredencialView> createState() => _CredencialView();
}

var formKey = GlobalKey<FormState>();

//Controladores dos Campos de Texto
//var email = TextEditingController();
//var senha = TextEditingController();

class _CredencialView extends State<CredencialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CREDENCIAIS',
          style: TextStyle(color: Colors.white), // Letras brancas
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, 
                children: [
              
                 Text(
              'este app é feito por bibiieiriririri.',
              style: TextStyle(fontSize: 30),
              
              textAlign: TextAlign.center,
            ),
            
  
            ])));
  }
}
