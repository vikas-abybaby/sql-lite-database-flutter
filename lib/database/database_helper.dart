import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/todo_model.dart';

class LocalDatabase {

   Future initDatabase() async {
  _database   = await openDatabase(
      join(await getDatabasesPath(), 'todos.db'),
      version: 1, 
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT, 
            dateTime INTEGER,
            isCompleted INTEGER,
            isSynced INTEGER,
            isDeleted INTEGER
          )
        ''');
      },
    );
  }

  static Future<List<Todo>> getTodos() async {
    final maps = await _db.query('todos', where: 'isDeleted = 0');
    return List.generate(maps.length, (i) => Todo.fromMap(maps[i]));
  }

  static Future<int> insertTodo(Todo todo) async => await _db.insert('todos', todo.toMap());

  static Future<int> updateTodo(Todo todo) async => await _db.update(
        'todos',
        todo.toMap(),
        where: 'id = ?',
        whereArgs: [todo.id],
      );

  static Future<int> softDelete(int id) async => await _db.update(
        'todos',
        {'isDeleted': 1, 'isSynced': 0},
        where: 'id = ?',
        whereArgs: [id],
      );

  static Future<int> deleteLocal(int id) async => await _db.delete('todos', where: 'id = ?', whereArgs: [id]);

  static Future<List<Todo>> getUnsynced() async => List.generate(
        (await _db.query('todos', where: 'isSynced = 0')).length,
        (i) => Todo.fromMap((await _db.query('todos', where: 'isSynced = 0'))[i]),
      );
}