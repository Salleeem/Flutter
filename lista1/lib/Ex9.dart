import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabLayout(),
    );
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Layout com Abas'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Aba 1'),
              Tab(text: 'Aba 2'),
              Tab(text: 'Aba 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Aba 1'),
            ),
            Center(
              child: Text('Aba 2'),
            ),
            Center(
              child: Text('Aba 3'),
            ),
          ],
        ),
      ),
    );
  }
}
