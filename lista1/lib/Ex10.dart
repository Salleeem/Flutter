import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimatedWidget(),
    );
  }
}

class MyAnimatedWidget extends StatefulWidget {
  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget> {
  double _positionX = 0.0;
  double _positionY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animação'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            final screenWidth = MediaQuery.of(context).size.width;
            final screenHeight = MediaQuery.of(context).size.height;
            _positionX = screenWidth * 0.25 * (1 - 2 * (DateTime.now().microsecond % 2));
            _positionY = screenHeight * 0.25 * (1 - 2 * (DateTime.now().microsecond % 2));
          });
        },
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(top: _positionY, left: _positionX),
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
