import 'package:exjson/View/produtodetalhes.dart';
import 'package:flutter/material.dart';
import 'package:exjson/Controll/produtoscontroll.dart';
import 'package:exjson/Model/produtosmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Produto>> _produtosFuture;
  final ProdutoControll _controll = ProdutoControll();

  @override
  void initState() {
    _produtosFuture = _loadProdutos();
    super.initState();
  }

  Future<List<Produto>> _loadProdutos() async {
    await _controll.loadProdutos();
    return _controll.produtos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Produtos"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Produto>>(
              future: _produtosFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  List<Produto> produtos = snapshot.data!;
                  return ListView.builder(
                    itemCount: produtos.length,
                    itemBuilder: (context, index) {
                      final produto = produtos[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(produto: produto),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(produto.nome),
                          subtitle: Text(
                            'Preço: ${produto.valor.toStringAsFixed(2)} - Categoria: ${produto.categoria}',
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Nenhum produto encontrado.'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
