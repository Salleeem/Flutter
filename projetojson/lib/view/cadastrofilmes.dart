import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projetojson/Controller/filmescontroll.dart';
import 'package:projetojson/model/filmemodel.dart';

class CadastroFilmeScreen extends StatefulWidget {
  const CadastroFilmeScreen({Key? key}) : super(key: key);

  @override
  State<CadastroFilmeScreen> createState() => _CadastroFilmeScreenState();
}

class _CadastroFilmeScreenState extends State<CadastroFilmeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _classiController = TextEditingController();
  final TextEditingController _elencoController = TextEditingController();

  final FilmesControll _controll = FilmesControll(); // Removi o 'new'

  File? _imagemSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Filme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
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
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Gênero do Filme'),
                  controller: _generoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira o gênero do filme';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Sinopse do Filme'),
                  controller: _sinopseController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira a sinopse do filme';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Duração do Filme'),
                  controller: _duracaoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira a duração do filme';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Ano de Estreia do Filme'),
                  controller: _anoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira o ano de estreia do filme';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Classificação do Filme'),
                  controller: _classiController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira a Classificação indicativa do filme';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Elenco do Filme - Separe por vírgula'),
                  controller: _elencoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Por favor, insira o elenco do filme';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 12,),
                _imagemSelecionada != null
                ? Image.file(
                     _imagemSelecionada!,
                     height: 200,
                     width: 200,
                     fit: BoxFit.cover,
                )
                : const SizedBox.shrink(),
                ElevatedButton(
                  onPressed: _tirarFoto,
                  child: const Text('Selecione a imagem'),
                ), // Adicionei a vírgula que estava faltando
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
      ),
    );
  }

  void _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagemSelecionada = File(pickedFile.path);
      });
    }
  }

  Filmes getfilmes() {
    return Filmes(
      nome: _nomeController.text,
      genero: _generoController.text,
      sinopse: _sinopseController.text,
      duracao: int.parse(_duracaoController.text),
      ano: int.parse(_anoController.text),
      classificacao: int.parse(_classiController.text),
      imagem: _imagemSelecionada!.path,
      elenco: _elencoController.text.split(',').map((e) => e.trim()).toList(), // Adicionei map para limpar espaços em branco
    );
  }

  void _cadastrarFilme() {
    //verificação
    _controll.loadFilmesfromJson();
    _controll.addFilme(getfilmes());
    //snackbar "sucesso"
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filme Cadastrado com Sucesso'),
        duration: Duration(seconds: 2),
      ),
    );
    _limpar();
  }

  void _limpar() {
    _nomeController.clear();
    _generoController.clear();
    _sinopseController.clear();
    _duracaoController.clear();
    _anoController.clear();
    _classiController.clear();
    _elencoController.clear();
    _imagemSelecionada = null;
    setState(() {
      
    });
  }
}
