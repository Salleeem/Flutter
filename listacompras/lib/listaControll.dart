import 'package:flutter/material.dart';
import 'package:listacompras/ListaModel.dart';

class ListaComprasController extends ChangeNotifier {
  final List<Compra> _compras = [];

  List<Compra> get compras => _compras;

  void adicionarCompra(String nome) {
    _compras.add(Compra(nome, false));
    notifyListeners();
  }

  void marcarComoComprado(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].comprado = true;
      notifyListeners();
    }
  }

 void removerCompra(int indice) {
  if (indice >= 0 && indice < _compras.length) {
    _compras.removeAt(indice);
    notifyListeners();
  }
}

}
