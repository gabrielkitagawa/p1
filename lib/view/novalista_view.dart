import 'package:flutter/material.dart';

class Item {
  String nome;
  int quantidade;

  Item({required this.nome, required this.quantidade});
}

class NovalistaView extends StatefulWidget {
  const NovalistaView({Key? key}) : super(key: key);

  @override
  State<NovalistaView> createState() => _NovalistaViewState();
}

class _NovalistaViewState extends State<NovalistaView> {
  int quantidade = 1;
  List<Item> itensLista = [];
  TextEditingController itemNameController = TextEditingController();
  String nomeItem = ''; 
  String nomeLista = ''; 

  bool mostrarLista = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'NOVA LISTA',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: itemNameController,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: 'Nome da Lista',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.shopping_cart),
              ),
              onChanged: (value) {
                setState(() {
                 
                  nomeLista = value;
                });
              },
            ),

            SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(200, 50),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Novo Item'),
                      content: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Nome'),
                                onChanged: (value) {
                                  setState(() {
                                    
                                    nomeItem = value;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantidade > 1) {
                                              quantidade--;
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.remove),
                                      ),
                                      Text(quantidade.toString()),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantidade++;
                                          });
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      minimumSize: Size(100, 50),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        String nome = nomeItem.isNotEmpty
                                            ? nomeItem
                                            : 'Item ${itensLista.length + 1}';
                                        itensLista.add(Item(nome: nome, quantidade: quantidade));
                                        itemNameController.clear();
                                        nomeItem = '';
                                        quantidade = 1; 
                                        mostrarLista = true;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text('Adicionar',style: TextStyle(fontSize: 15, color: Colors.white)),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      minimumSize: Size(100, 50),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar',style: TextStyle(fontSize: 15, color: Colors.white)),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Text('Adicionar Item na Lista', style: TextStyle(fontSize: 15, color: Colors.white)),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(100, 50),
              ),
              onPressed: () {
                setState(() {
                  mostrarLista = true;
                });
              },
              child: Text('Atualizar', style: TextStyle(fontSize: 15, color: Colors.white)),
            ),

            SizedBox(height: 20),

            
            Text(
              'Lista: $nomeLista',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            
            if (mostrarLista)
              Expanded(   
                child: ListView.builder(
                  itemCount: itensLista.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(itensLista[index].nome),
                          Text('Quantidade: ${itensLista[index].quantidade}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: Size(double.infinity, 50),
          ),
          onPressed: () {},
          child: Text('Gerar lista', style: TextStyle(fontSize: 15, color: Colors.white)),
          
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NovalistaView(),
  ));
}
