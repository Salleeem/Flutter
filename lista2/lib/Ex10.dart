import 'package:flutter/material.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barra de Progresso Dinâmica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  double _progressValue = 0.0;

  void _simularProgresso() {
    setState(() {
      _progressValue += 0.1;
      if (_progressValue >= 1.0) {
        _progressValue = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barra'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _simularProgresso,
              child: const Text('Aperte'),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: _progressValue,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 20),
            CircularProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
