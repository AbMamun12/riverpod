import 'package:flutter/material.dart';
import '../data/todo_model.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;
  final VoidCallback? onMoreTap;

  const TodoCard({
    super.key,
    required this.todo,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: todo.isCompleted
            ? Colors.green.shade50
            : Colors.red.shade50, // status ভিত্তিক card color
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: todo.isCompleted ? Colors.green : Colors.red,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Left
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: todo.isCompleted ? Colors.green.shade900 : Colors.red.shade900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  todo.date.toString().substring(0, 10),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),

          // 3 dot menu
          GestureDetector(
            onTap: onMoreTap,
            child: const Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}
