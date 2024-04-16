import 'package:flutter/material.dart';

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({Key? key});

  @override
  State<CarrinhoView> createState() => _CarrinhoView();
}

class _CarrinhoView extends State<CarrinhoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho',
          style: TextStyle(color: Colors.white), 
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Lista 1'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('loja: '),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Valor da Compra: '),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: Icon(Icons.shopping_cart),
                  onLongPress: () {
                    Navigator.pushNamed(context, '/carrinho');
                  },
                ),
                
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
              shape: CircleBorder(), 
              padding: EdgeInsets.all(20), 
             
            ),
            onPressed: () {
              // Adicione aqui a lógica para criar uma nova lista de compras
              Navigator.pushNamed(context, '/nova_lista');
            },
            child: Icon(Icons.add, color: Colors.blue),
          ),

          SizedBox(height: 40),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, 
              minimumSize: Size(200, 50),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Voltar',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}