import 'package:flutter/material.dart';
import 'package:api_geo/Screen/home_screen.dart';
import 'package:api_geo/Screen/search_screen.dart';
import 'package:api_geo/Screen/favorite_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto Clima",
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/search':(context) => SearchScreen(),
        'favorites':(context) => FavoritesScreen()
      },
    );
  }
}