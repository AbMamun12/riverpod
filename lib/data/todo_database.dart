import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'todo_model.dart';

class TodoDatabase {
  static final TodoDatabase instance = TodoDatabase._init();
  static Database? _database;

  TodoDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("todos.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE todos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  date TEXT NOT NULL,
  isCompleted INTEGER NOT NULL
)
''');
  }

  // ===== CRUD ======

  Future<int> create(TodoModel todo) async {
    final db = await instance.database;

    return await db.insert("todos", {
      'title': todo.title,
      'date': todo.date.toIso8601String(),
      'isCompleted': todo.isCompleted ? 1 : 0,
    });
  }

  Future<List<TodoModel>> getAll() async {
    final db = await instance.database;

    final res = await db.query("todos");

    return res.map((e) => TodoModel(
      id: e['id'] as int,
      title: e['title'] as String,
      date: DateTime.parse(e['date'] as String),
      isCompleted: (e['isCompleted'] as int) == 1,
    )).toList();
  }

  Future<List<TodoModel>> getToday() async {
    final db = await instance.database;

    final today = DateTime.now().toIso8601String().substring(0,10);

    final res = await db.query(
      "todos",
      where: "date LIKE ?",
      whereArgs: ["$today%"],
    );

    return res.map((e) => TodoModel(
      id: e['id'] as int,
      title: e['title'] as String,
      date: DateTime.parse(e['date'] as String),
      isCompleted: (e['isCompleted'] as int) == 1,
    )).toList();
  }


  Future<int> update(int id, bool complete) async {
    final db = await instance.database;

    return db.update(
      "todos",
      {'isCompleted': complete ? 1 : 0},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
