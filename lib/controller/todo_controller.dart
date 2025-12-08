import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/todo_model.dart';
import '../data/todo_database.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {

  @override
  Future<List<TodoModel>> build() async {
    return [];
  }

  // LOAD ALL
  Future<void> loadAll() async {
    final list = await TodoDatabase.instance.getAll();
    state = AsyncData(list);
  }

  // LOAD TODAY
  Future<void> loadToday() async {
    final list = await TodoDatabase.instance.getToday();
    state = AsyncData(list);
  }

  // ADD TODO
  Future<void> addTodo(TodoModel todo) async {
    await TodoDatabase.instance.create(todo);
    await loadToday();
  }


  // UPDATE STATUS (complete / incomplete)
  Future<void> updateStatus(TodoModel todo, bool isCompleted) async {
    // DB update
    await TodoDatabase.instance.update(
      todo.id!,
      isCompleted,
    );

    // local update
    todo.isCompleted = isCompleted;

    // UI refresh
    final current = state.value ?? [];
    state = AsyncData([...current]);
  }

}

