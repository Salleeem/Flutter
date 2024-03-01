// ComprasController.dart

import 'package:flutter/material.dart';
import 'listaModel.dart';

class ComprasController extends ChangeNotifier {
  final List<ItemLista> _itens = [];

  List<ItemLista> get itens => _itens;

  void adicionarItem(
      String nome, int quantidade, double preco) {
    _itens.add(ItemLista(nome, quantidade, preco, false));
    notifyListeners();
  }

  void marcarItemComoConcluido(int index, bool value) {
    _itens[index].concluido = value;
    notifyListeners();
  }

  void removerItem(int index) {
    _itens.removeAt(index);
    notifyListeners();
  }

  void editarItem(int index, String newNome, int newQuantidade,
      double newPreco) {
    _itens[index] = ItemLista(newNome, newQuantidade, newPreco,
        _itens[index].concluido);
    notifyListeners();
  }
}
