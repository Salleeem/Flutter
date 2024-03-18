import 'package:flutter/material.dart';
import 'package:lista1/Ex1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exercicio2")),
        body: Container(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Texto da Primeira Coluna'),
                  // Ícone
                ],
              ),
              Column(
                children: [
                  Text('Texto da Segunda Coluna'),
                ],
              ),
              Column(
                children: [
                  Text('Texto da Terceira Coluna'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
