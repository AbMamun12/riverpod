import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/widgets/status_dialog.dart';
import '../controller/todo_controller.dart';
import '../widgets/todo_card.dart';
class AllScreen extends ConsumerStatefulWidget {
  const AllScreen({super.key});

  @override
  ConsumerState<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends ConsumerState<AllScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(todoControllerProvider.notifier).loadAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoControllerProvider);

    return todos.when(
      data: (list) {
        if (list.isEmpty) return const Center(child: Text("No todos yet"));

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(todoControllerProvider.notifier).loadAll();
          },
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) {
              final t = list[i];
              return TodoCard(
                todo: t,
                onMoreTap: () {
                  showStatusDialog(context, ref, t);
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
