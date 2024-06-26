import 'package:flutter/material.dart';

class ResenharView extends StatefulWidget {
  const ResenharView({Key? key}) : super(key: key);

  @override
  State<ResenharView> createState() => _ResenharView();
}

class _ResenharView extends State<ResenharView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmaSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REDEFINIR SENHA',
          style: TextStyle(color: Colors.white), // Letras brancas
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Image.asset(
                'lib/imagens/resenhar.png',
                 width: 200,
                 height: 200,
              ),

              SizedBox(height: 30),

              TextFormField(
                style: TextStyle(fontSize: 20),
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Insira seu Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu Email';
                  } else if (!isEmailValid(value)) {
                    return 'Email inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: senhaController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Nova Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe uma Senha';
                  } else if (value.length < 8) {
                    return 'A senha deve ter pelo menos 8 caracteres';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: confirmaSenhaController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Confirme a nova Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirme a Senha';
                  } else if (value != senhaController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Cor de fundo azul
                minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Text('REGISTRAR',style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}