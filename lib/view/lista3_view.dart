import 'package:flutter/material.dart';

class Lista3View extends StatefulWidget {
  const Lista3View({Key? key}) : super(key: key);

  @override
  State<Lista3View> createState() => _Lista3View();
}

class _Lista3View extends State<Lista3View> {
  TextEditingController pesquisaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  List<String> listaFiltrada = [];
  List<String> ListaFeira = [
    'Batata',
    'Cenoura',
    'Alface',
    'Tomate',
    'Cebola',
    'Brócolis',
    'Alho',

  ];
  Map<String, int> quantidades = {};

  @override
  void initState() {
    super.initState();
    listaFiltrada.addAll(ListaFeira);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feira',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pesquisaController,
              onChanged: (value) {
                setState(() {
                  listaFiltrada = ListaFeira
                      .where((item) =>
                          item.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Pesquisar',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listaFiltrada.length,
              itemBuilder: (context, index) {
                String itemName = listaFiltrada[index];
                int quantidade = quantidades[itemName] ?? 0;
                return _buildListItem(itemName, quantidade);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    controller: quantidadeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantidade',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String nome = nomeController.text.trim();
                      int quantidade = int.tryParse(quantidadeController.text.trim()) ?? 0;
                      if (nome.isNotEmpty && !ListaFeira.contains(nome)) {
                        ListaFeira.add(nome);
                        quantidades[nome] = quantidade;
                        listaFiltrada.add(nome);
                        nomeController.clear();
                        quantidadeController.clear();
                                            }
                      else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(  
                              content: Text("O item '$nome' já está na lista."),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: Size(150, 50),
                                  ),
                                  onPressed: () {
                                  Navigator.of(context).pop();
                                  },
                                  child: Text("OK", 
                                    style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,),)
                                ),
                              ],
                      );
                      },);}
                      }
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(100, 50),
                  ),
                  child: Text(
                    'Adicionar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(150, 50),
              ),
              child: Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String itemName, int quantidade) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: quantidades.containsKey(itemName) && quantidades[itemName]! > 0,
                onChanged: (value) {
                  setState(() {
                    if (value != null && value) {
                      quantidades[itemName] = 1; 
                    } else {
                      quantidades[itemName] = 0; 
                    }
                  });
                },
              ),
              Text(itemName),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (quantidade > 0) {
                      quantidades[itemName] = quantidade - 1;
                    }
                  });
                },
              ),
              Text(
                quantidade.toString(),
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantidades[itemName] = quantidade + 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    ListaFeira.remove(itemName);
                    listaFiltrada.remove(itemName);
                    quantidades.remove(itemName);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Lista3View(),
  ));
}
