import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN',
          style: TextStyle(color: Colors.white), 
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
            children: [


              Image.asset(
                'lib/imagens/logo.png',
                 width: 200,
                 height: 200,
              ),
              
              SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                style: TextStyle(fontSize: 20), 
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
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

              SizedBox(height: 10),

              TextFormField(
                controller: senhaController,
                style: TextStyle(fontSize: 20), // Tamanho da fonte 20
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  contentPadding: EdgeInsets.symmetric(vertical: 20), // Espaçamento vertical
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

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final email = emailController.text;
                    final senha = senhaController.text;
                    Navigator.pushNamed(context, 'lista');
                  }
                },
                child: Text('LOGIN', style: TextStyle(fontSize: 15, color: Colors.white)), // Tamanho da fonte 20 e cor branca
              ),

              SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'cadastro');
                },
                child: Text('Criar Conta', style: TextStyle(fontSize: 15, color: Colors.white)), // Tamanho da fonte 20 e cor branca
              ),

              SizedBox(height: 50),

              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:  Colors.white, 
                  minimumSize: Size(200, 10),
                  side: BorderSide.none,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'resenhar');
                },
                child: Text('Esqueci minha senha', style: TextStyle(fontSize: 15, color: Colors.blue)), // Tamanho da fonte 20 e cor branca
              ),

              SizedBox(height: 10),

              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:  Colors.transparent, 
                  minimumSize: Size(200, 10),
                  side: BorderSide.none,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'credencial');
                },
                child: Text('Credenciais do desenvolvedor', style: TextStyle(fontSize: 15, color: Colors.blue)), // Tamanho da fonte 20 e cor branca
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