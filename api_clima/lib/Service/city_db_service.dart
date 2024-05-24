import 'package:sqflite/sqflite.dart';

class CityDbService {
  //atributos de detalha do banco
  static const String DB_NOME = 'db.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'cities'; // Nome da tabela
  static const String CREATE_CONTACTS_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE cities(
          id SERIAL,
          cityname TEXT,
          favoritescities BOOLEAN)""";

  //getDatabase
  Future<Database> _getDatabase() async{
    return openDatabase(
      DB_NOME,
      version: 1,
      onCreate: (db, version) {
        return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
      },
    );
  }

}