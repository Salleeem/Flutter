import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 50),
            Text(
              'Teste',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 166, 0),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Firebase',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 0, 0),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: const Text('Cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
