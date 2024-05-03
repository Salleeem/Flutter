import 'package:flutter/material.dart';

class CadastroFilmeScreen extends StatefulWidget {
  const CadastroFilmeScreen({Key? key}) : super(key: key);

  @override
  State<CadastroFilmeScreen> createState() => _CadastroFilmeScreenState();
}

class _CadastroFilmeScreenState extends State<CadastroFilmeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Filme'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome do Filme'),
                controller: _nomeController,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Por favor, insira o nome do filme';
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _cadastrarFilme();
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _cadastrarFilme() {
    // Adicione aqui a lógica para cadastrar o filme
  }
}
