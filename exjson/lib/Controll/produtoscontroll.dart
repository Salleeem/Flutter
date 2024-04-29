import 'dart:convert';
import 'package:flutter/services.dart';
import '../Model/produtosmodel.dart';

class ProdutoControll {
  List<Produto> _produtos = [];

  List<Produto> get produtos => _produtos;

  Future<void> loadProdutos() async {
    final data = await rootBundle.loadString('assets/produtos.json');
    final jsonList = json.decode(data) as List<dynamic>;
    _produtos.clear();
    _produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
  }
}
