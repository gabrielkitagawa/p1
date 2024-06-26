import 'package:flutter/material.dart';

class Lista1View extends StatefulWidget {
  const Lista1View({Key? key}) : super(key: key);

  @override
  State<Lista1View> createState() => _Lista1View();
}

class _Lista1View extends State<Lista1View> {
  TextEditingController pesquisaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  List<String> listaFiltrada = [];
  List<String> ListaMercado = [
    'Leite',
    'Arroz',
    'Farinha',
    'Ovos',
    'Óleo',
    'Açucar',
    'Feijão',
    'Carne',
    'Margarina',
    'Refri',
    'Cerveja',
  ];
  Map<String, int> quantidades = {};

  @override
  void initState() {
    super.initState();
    listaFiltrada.addAll(ListaMercado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mercado',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: TextFormField(
              controller: pesquisaController,
              onChanged: (value) {
                setState(() {
                  listaFiltrada = ListaMercado
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
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
            child: Row(
              children: [
                Expanded(
                  child: 
                    TextFormField(
                    style: TextStyle(fontSize: 15), 
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: ' Item',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(fontSize: 15),
                    controller: quantidadeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      labelText: ' Quantidade',
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
                      if (nome.isNotEmpty && !ListaMercado.contains(nome)) {
                        ListaMercado.add(nome);
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
                activeColor: Colors.blue, 
                checkColor: Colors.white, 
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
                icon: Icon(Icons.remove, size:15),
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
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: Icon(Icons.add, size:15),
                onPressed: () {
                  setState(() {
                    quantidades[itemName] = quantidade + 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Color.fromARGB(166, 212, 37, 24),),
                onPressed: () {
                  setState(() {
                    ListaMercado.remove(itemName);
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
    home: Lista1View(),
  ));
}
