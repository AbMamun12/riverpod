/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/todo_controller.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(context, ref) {
    final todos = ref.watch(todoControllerProvider);

    return todos.when(
      data: (list){
        if(list.isEmpty){
          return const Center(
            child: Text(
              "No todos for today",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(todoControllerProvider.notifier).getTodayTodos();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (_, i){
              final t = list[i];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(
                    t.title,
                    style: TextStyle(
                      decoration: t.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    t.date.toString().substring(0,10),
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: Checkbox(
                    value: t.isCompleted,
                    onChanged: (_){
                      ref.read(todoControllerProvider.notifier).toggle(i);
                    },
                  ),
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
import '../controller/todo_controller.dart';
import '../data/todo_model.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(context, ref) {
    final todos = ref.watch(todoControllerProvider);

    return todos.when(
      data: (list) {
        if (list.isEmpty) {
          return const Center(
            child: Text(
              "No todos for today",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(todoControllerProvider.notifier).getTodayTodos();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (_, i) {
              final t = list[i];
              return Card(
                color: Colors.green.shade50, // light green
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  title: Text(
                    t.title,
                    style: TextStyle(
                      decoration: t.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    t.date.toString().substring(0, 10),
                    style: const TextStyle(fontSize: 12),
                  ),
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

class CompleteBottomSheet extends ConsumerWidget {
  final int todoIndex;
  final bool isCompleted;

  const CompleteBottomSheet({
    super.key,
    required this.todoIndex,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mark as",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.check, color: Colors.green),
            title: const Text("Complete"),
            onTap: () async {
              if (!isCompleted) {
                await ref.read(todoControllerProvider.notifier).toggle(todoIndex);
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.close, color: Colors.red),
            title: const Text("Incomplete"),
            onTap: () async {
              if (isCompleted) {
                await ref.read(todoControllerProvider.notifier).toggle(todoIndex);
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
