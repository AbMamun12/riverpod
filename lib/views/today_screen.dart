import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/todo_controller.dart';
import '../data/todo_model.dart';
import '../widgets/todo_card.dart';

class TodayScreen extends ConsumerStatefulWidget {
  const TodayScreen({super.key});

  @override
  ConsumerState<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends ConsumerState<TodayScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(todoControllerProvider.notifier).loadToday();
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoControllerProvider);

    return todos.when(
      data: (list) {
        if (list.isEmpty) {
          return const Center(child: Text("No todos for today"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(todoControllerProvider.notifier).loadToday();
          },
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) {
              final t = list[i];
              return TodoCard(
                todo: t,
                onMoreTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      bool tempStatus =
                          t.isCompleted; // initially current status

                      return AlertDialog(
                        title: const Text("Change Status"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RadioListTile<bool>(
                              title: const Text("Complete"),
                              value: true,
                              groupValue: tempStatus,
                              onChanged: (v) {
                                tempStatus = v!;
                                (context as Element).markNeedsBuild();
                              },
                            ),
                            RadioListTile<bool>(
                              title: const Text("Incomplete"),
                              value: false,
                              groupValue: tempStatus,
                              onChanged: (v) {
                                tempStatus = v!;
                                (context as Element).markNeedsBuild();
                              },
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () {
                              // update todo status inside Riverpod controller
                              ref
                                  .read(todoControllerProvider.notifier)
                                  .updateStatus(t, tempStatus);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
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
