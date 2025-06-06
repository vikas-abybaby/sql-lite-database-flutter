import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/todo_model.dart';

class LocalDatabase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'todos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            productId INTEGER,
            description TEXT, 
            dateTime INTEGER,
            isEdit INTEGER,
            isSynced INTEGER,
            isDeleted INTEGER
          )
        ''');
      },
    );
  }

  static Future<List> getTodos() async {
    final db = await database;
    final maps = await db.query(
      'todos',
      //where: 'isDeleted = 0'
    );
    return maps;
    
    //List.generate(maps.length, (i) => Todo.fromJson(maps[i]));
  }

  static Future<int> insertTodo(Todo todo) async {
    final db = await database;
    return await db.insert('todos', todo.toJson());
  }

  static Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return await db.update(
      'todos',
      todo.toJson(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  static Future<int> softDelete(int id) async {
    final db = await database;
    return await db.update(
      'todos',
      {'isDeleted': 1, 'isSynced': 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteLocal(int id) async {
    final db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

 

  static Future<void> clearAllTodos() async {
    final db = await database;
    await db.delete('todos');
  }
}
