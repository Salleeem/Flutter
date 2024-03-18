import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Exercicio 3")),
        body: ListView(
          children: [
            for (String item in items)
              Card(
                child: ListTile(
                  title: Text(item),
                  subtitle: const Text('Informações fictícias'),
                  leading: const Icon(Icons.info),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
