/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/todo_controller.dart';

class AllScreen extends ConsumerWidget {
  const AllScreen({super.key});

  @override
  Widget build(context, ref) {
    final todos = ref.watch(todoControllerProvider);

    return todos.when(
      data: (list){
        if(list.isEmpty){
          return const Center(
            child: Text(
              "No todos yet",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(todoControllerProvider.notifier).getAllTodos();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (_, i){
              final t = list[i];
              return Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  title: Text(
                    t.title,
                    style: TextStyle(
                      decoration: t.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(t.date.toString().substring(0,10)),
                  trailing: t.isCompleted
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                ),
              );
            },
          ),
        );
      },
      loading: ()=> const Center(child: CircularProgressIndicator()),
      error: (e,_)=> Center(child: Text(e.toString())),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/views/today_screen.dart';
import '../controller/todo_controller.dart';

class AllScreen extends ConsumerWidget {
  const AllScreen({super.key});

  @override
  Widget build(context, ref) {
    final todos = ref.watch(todoControllerProvider);

    return todos.when(
      data: (list) {
        if (list.isEmpty) {
          return const Center(
            child: Text(
              "No todos yet",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(todoControllerProvider.notifier).getAllTodos();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (_, i) {
              final t = list[i];
              return Card(
                color: Colors.green.shade50,
                elevation: 1,
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  title: Text(
                    t.title,
                    style: TextStyle(
                      decoration: t.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(t.date.toString().substring(0, 10)),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.green),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return CompleteBottomSheet(
                            todoIndex: i,
                            isCompleted: t.isCompleted,
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
    );
  }
}
