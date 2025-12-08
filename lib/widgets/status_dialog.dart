import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/todo_controller.dart';
import '../data/todo_model.dart';

Future<void> showStatusDialog(
    BuildContext context,
    WidgetRef ref,
    TodoModel todo,
    ) async {
  bool tempStatus = todo.isCompleted;

  await showDialog(
    context: context,
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
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
                    setState(() {
                      tempStatus = v!;
                    });
                  },
                ),
                RadioListTile<bool>(
                  title: const Text("Incomplete"),
                  value: false,
                  groupValue: tempStatus,
                  onChanged: (v) {
                    setState(() {
                      tempStatus = v!;
                    });
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
                  ref.read(todoControllerProvider.notifier).updateStatus(
                    todo,
                    tempStatus,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    },
  );
}

