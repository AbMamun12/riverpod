import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/todo_controller.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(context, ref) {

    final todos = ref.watch(todoControllerProvider);

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, i){
        final t = todos[i];
        return ListTile(
          title: Text(t.title),
          subtitle: Text(t.date.toString()),
          trailing: IconButton(
            icon: Icon(
              t.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            onPressed: (){
              ref.read(todoControllerProvider.notifier).toggleTodo(i);
            },
          ),
        );
      },
    );
  }
}
