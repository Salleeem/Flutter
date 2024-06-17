import 'package:ex_firebase/Services/auth_firebase.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final AuthFirebase _authFirebase = AuthFirebase();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Coloque um email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Coloque uma senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Senha incorreta';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _registrarUsuario();
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registrarUsuario() async {
    if (_formKey.currentState!.validate() &&
        _passwordController.text == _confirmPasswordController.text) {
      try {
        await _authFirebase.signUp(
            _emailController.text, _passwordController.text);
        Navigator.pushReplacementNamed(context, '/login');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }
  }
}
