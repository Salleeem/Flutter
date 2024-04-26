

import 'package:exjson/Controll/produtoscontroll.dart';
import 'package:exjson/Model/produtosmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdutoControll _controll = ProdutoControll();

  @override
  void initState() {
    _controll.loadProdutos();
    super.initState();
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
                  future: _controll.loadProdutos(),
                  builder: (context, snapshot) {
                    if (_controll.produtos.isNotEmpty) {
                      return ListView.builder(
                        itemCount: _controll.produtos.length,
                        itemBuilder: (context, index) {
                          final produto = _controll.produtos[index];
                          return ListTile(
                            title: Text(produto.nome),
                            subtitle: Text(
                                'Preço: ${produto.valor.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                          );
                        },
                      );
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        ],
      ),
    );
  }
}
