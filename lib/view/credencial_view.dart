import 'package:flutter/material.dart';

class CredencialView extends StatefulWidget {
  const CredencialView({super.key});

  @override
  State<CredencialView> createState() => _CredencialView();
}

var formKey = GlobalKey<FormState>();



class _CredencialView extends State<CredencialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CREDENCIAIS',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, 
                children: [
                                
                Image.asset(
                  'lib/imagens/dev.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 30), 
                Text(
                  'este app é feito por bibiieiriririri.',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
            ])));
  }
}
