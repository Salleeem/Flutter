import 'package:listacompras/ListaControll.dart';
import 'package:listacompras/ListaView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaApp extends StatelessWidget {
  const ListaApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a ListaTarefasScreen e utilizando o Provider
      home: ChangeNotifierProvider(
        create: (context) => ListaComprasController(),
        child: ListaTarefasScreen(),
      ),
    );
  }
}