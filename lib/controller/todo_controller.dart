import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/todo_model.dart';
import '../data/todo_database.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {

  @override
  Future<List<TodoModel>> build() async {
    // app open হলে আজকের todo load হবে
    return await getTodayTodos();
  }

  // ===== GET =====

  Future<List<TodoModel>> getAllTodos() async {
    final list = await TodoDatabase.instance.getAll();
    state = AsyncData(list);
    return list;
  }

  Future<List<TodoModel>> getTodayTodos() async {
    final list = await TodoDatabase.instance.getToday();
    state = AsyncData(list);
    return list;
  }

  // ===== CREATE =====
  Future<void> addTodo(TodoModel todo) async {
    await TodoDatabase.instance.create(todo);
    await getTodayTodos();  // refresh today
  }

  // ===== TOGGLE =====
  Future<void> toggle(int index) async {
    final todos = state.value ?? [];
    final todo = todos[index];

    await TodoDatabase.instance.update(
      todo.id!,
      !todo.isCompleted,
    );

    await getTodayTodos();
  }
}
