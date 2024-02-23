import 'package:flutter/material.dart';
import 'package:listacompras/LIstaView.dart';
import 'package:listacompras/ListaControll.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ListaApp());
}

class ListaApp extends StatelessWidget {
  const ListaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ListaComprasController(),
        child: ListaComprasScreen(),
      ),
    );
  }
}
