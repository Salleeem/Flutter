import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exemplo JSON",
      theme: ThemeData(primarySwatch: Color.purple),
      home: HomePage(),
    );
  }
}
