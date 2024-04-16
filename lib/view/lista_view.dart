import 'package:flutter/material.dart';

class ListaView extends StatefulWidget {
  const ListaView({Key? key});

  @override
  State<ListaView> createState() => _ListaView();
}

class _ListaView extends State<ListaView> {
  List<String> listaDeCompras = ['Mercado', 'Material de Construção', 'Feira'];
  TextEditingController pesquisaController = TextEditingController();
  List<String> listaFiltrada = [];

  @override
  void initState() {
    listaFiltrada = listaDeCompras;
    super.initState();
  }

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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pesquisaController,
              decoration: InputDecoration(
                labelText: 'Pesquisar Listas de Compras',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  listaFiltrada = listaDeCompras
                      .where((item) => item.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),

          ),
          SizedBox(height: 20),

          Expanded(
            child: ListView.separated(
              itemCount: listaFiltrada.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    listaFiltrada[index],
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(context, 'lista${index + 1}');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _mostrarDialogoExclusao(context, index);
                        },
                      ),
                    ],
                  ),
                );
              },
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
              padding: EdgeInsets.all(50), 
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'novalista');
            },
            child: Icon(Icons.add, color: Colors.blue),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  _mostrarDialogoExclusao(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar exclusão"),
          content: Text("Tem certeza de que deseja excluir esta lista?"),
          actions: [
            TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(100, 50),
              ),
              onPressed: () {
                setState(() {
                  listaDeCompras.removeAt(index);
                });
                Navigator.of(context).pop(); 
              },
              child: Text("Confirmar", style: TextStyle(fontSize: 15, color: Colors.white)),
            ),

            TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(100, 50),
              ),
              onPressed: () {
                 Navigator.pop(context); 
              },
              child: Text("Cancelar", style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}