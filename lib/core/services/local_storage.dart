import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/data/models/todo_model.dart';

class LocalDatabase {
  static Database? _database;
  static final LocalDatabase instance = LocalDatabase._init();

  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isChecked INTEGER NOT NULL DEFAULT 0)',
        );
      },
    );
  }

  Future<int> insertTodo(TodoModel todo) async {
    final db = await instance.database;
    return await db.insert('todos', todo.toMap());
  }

  Future<List<TodoModel>> fetchTodos() async {
    final db = await instance.database;
    final result = await db.query('todos');
    return result.map((map) => TodoModel.fromMap(map)).toList();
  }

  Future<void> updateTodo(TodoModel todo) async {
    final db = await database;
    await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(TodoModel todo) async {
    final db = await database;
    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
