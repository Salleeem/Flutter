// Controller
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class BancoDadosCrud {
  static const String DB_NOME = 'contacts.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'contacts'; // Nome da tabela
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY," +
          "nome TEXT, email TEXT, telefone TEXT," +
          "endereco TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future<void> create(ContatoModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(TABLE_NOME, model.toMap());
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<ContatoModel>> getContacts() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NOME);

      return List.generate(
        maps.length,
        (i) {
          return ContatoModel.fromMap(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future<void> update(ContatoModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NOME,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NOME,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
