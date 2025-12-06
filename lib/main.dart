import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/views/splash_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TodoApp(),
    ),
  );
}
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
    );
  }
}
