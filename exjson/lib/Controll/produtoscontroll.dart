import 'dart:convert';
import 'package:exjson/Model/produtosmodel.dart';
import 'package:flutter/services.dart';

class ProdutoControll {

  //Atributos(Lista Privada)
  List<Produto> _produtos = [];

  // Método get(Público)
  List<Produto> get produtos => _produtos;

  //Métodos para decodificar e codificar o Json
  Future<void> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    _produtos.clear();
    // Converte os objetos da lista JSON em instâncias de Produto e adiciona à lista de produtos
    _produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
  }


}