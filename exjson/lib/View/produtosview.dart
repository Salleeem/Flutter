import 'package:exjson/View/produtodetalhes.dart';
import 'package:flutter/material.dart';
import 'package:exjson/Controll/produtoscontroll.dart';
import 'package:exjson/Model/produtosmodel.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdutoControll _controller = ProdutoControll();

  // @override
  // void initState() {
  //   _controller.loadProdutos();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Produtos"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<List<Produto>>(
                  future: _controller.loadProdutos(),
                  builder: (context, snapshot) {
                    if (_controller.produtos.isNotEmpty) {
                      return ListView.builder(
                        itemCount: _controller.produtos.length,
                        itemBuilder: (context, index) {
                          final produto = _controller.produtos[index];
                          return ListTile(
                            leading: Image.asset(produto.foto),
                            title: Text(produto.nome),
                            subtitle: Text(
                                'Preço: ${produto.valor.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
