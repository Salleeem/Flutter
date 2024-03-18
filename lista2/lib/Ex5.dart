import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Layout Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Responsividade(),
    );
  }
}

class Responsividade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isWideScreen = screenSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Responsivo'),
      ),
      body: Center(
        child: isWideScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenSize.width * 0.4,
                    height: screenSize.height * 0.6,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: screenSize.width * 0.4,
                    height: screenSize.height * 0.6,
                    color: Colors.red,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenSize.width * 0.8,
                    height: screenSize.height * 0.3,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: screenSize.width * 0.8,
                    height: screenSize.height * 0.3,
                    color: Colors.red,
                  ),
                ],
              ),
      ),
    );
  }
}
