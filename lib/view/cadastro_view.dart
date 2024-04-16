import 'package:flutter/material.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmaSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CADASTRO',
          style: TextStyle(color: Colors.white), // Letras brancas
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white), // Definindo a cor do ícone
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nomeController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                style: TextStyle(fontSize: 20),
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Insira um Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um Email';
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
                  labelText: 'Insira uma Senha',
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
                  labelText: 'Confirme a Senha',
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
                  backgroundColor: Colors.blue, 
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'REGISTRAR',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
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