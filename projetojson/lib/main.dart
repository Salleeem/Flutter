import 'package:flutter/material.dart';
import 'package:projetojson/view/cadastrofilmes.dart';
import 'package:projetojson/view/homeview.dart';
import 'package:projetojson/view/listafilmes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto JSON",
      theme: ThemeData(
        primaryColor: Colors.red, // Definindo a cor primária como vermelho
      ),
      home: const HomeScreen(), // Corrigido para instanciar HomeScreen como objeto
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => const HomeScreen(),
        '/list':(context) => const ListaFilmesScreen(),
        '/cadastro':(context) => const CadastroFilmeScreen()
      }, // Você pode adicionar rotas aqui, se necessário
    );
  }
}
