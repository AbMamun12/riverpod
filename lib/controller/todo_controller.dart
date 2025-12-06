import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/todo_model.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {

  @override
  List<TodoModel> build() {
    // initial todo list (empty)
    return [];
  }

  void addTodo(TodoModel todo){
    state = [...state, todo];
  }

  void toggleTodo(int index){
    final t = state[index];
    state[index] = t.copyWith(isCompleted: !t.isCompleted);
  }
}
