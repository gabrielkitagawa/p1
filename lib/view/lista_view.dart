import 'package:flutter/material.dart';

class ListaView extends StatefulWidget {
  const ListaView({Key? key});

  @override
  State<ListaView> createState() => _ListaView();
}

class _ListaView extends State<ListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Listas de Compra',
          style: TextStyle(color: Colors.white), // Letras brancas
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Ícone de logout
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: <Widget>[
                // Seu conteúdo da lista aqui
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(), // Para tornar o botão redondo
              padding: EdgeInsets.all(50), // Espaçamento interno
             
            ),
            onPressed: () {
              // Adicione aqui a lógica para criar uma nova lista de compras
              Navigator.pushNamed(context, 'novalista');
            },
            child: Icon(Icons.add, color: Colors.blue),
          ),

          SizedBox(height: 40),

        ],
      ),
    );
  }
}