import 'package:flutter/material.dart';

class LojaView extends StatefulWidget {
  const LojaView({super.key});

  @override
  State<LojaView> createState() => _LojaView();
}

var formKey = GlobalKey<FormState>();

//Controladores dos Campos de Texto
//var email = TextEditingController();
//var senha = TextEditingController();

class _LojaView extends State<LojaView> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOJA',
          style: TextStyle(color: Colors.white), // Letras brancas
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: 
      ListView(
        children: <Widget>[
            ListTile(
            title: Text('Item 1'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descrição do Item 1'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text('Unidade: R\$ 10.00'),
                    ],
                  ),

              ],
            ),
            leading: Icon(Icons.shopping_cart),
              onLongPress: () {
              Navigator.pushNamed(context, '/carrinho');
            },
          ),

          // Adicione mais ListTiles conforme necessário
        ],
      ),
    );
  }
}
