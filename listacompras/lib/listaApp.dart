import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'listaControll.dart';
import 'listaView.dart';

void main() {
  runApp(ComprasApp());
}

class ComprasApp extends StatelessWidget {
  const ComprasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ComprasController(),
      child: MaterialApp(
        title: 'Lista de Compras',
        home: ComprasView(),
      ),
    );
  }
}