import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:projetojson/model/filmemodel.dart';

class FilmesControll {
  //atributo
  List<Filmes> _listFilmes = [];
  //get
  List<Filmes> get listFilmes => _listFilmes;
  //métodos salvar / carregar json
  Future<void> saveFilmestoJson() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    final file = File('$path/filmes.json');
    final jsonList = _listFilmes.map((filme) => filme.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }

  Future<List<Filmes>> loadFilmesfromJson() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String path = appDocDir.path;
      final file = File('$path/filmes.json');
      final jsonList = jsonDecode(await file.readAsString());
      _listFilmes =
          jsonList.map<Filmes>((json) => Filmes.fromJson(json)).toList();
    } catch (e) {
      _listFilmes = [];
    }
    return _listFilmes;
  }

  //método adicionar
  void addFilme(Filmes filme) {
    _listFilmes.add(filme);
    saveFilmestoJson();
  }
}
