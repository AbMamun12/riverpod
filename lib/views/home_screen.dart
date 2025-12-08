import 'package:flutter/material.dart';
import 'package:todo_riverpod/views/add_todo_screen.dart';
import 'package:todo_riverpod/views/all_screen.dart';
import 'package:todo_riverpod/views/today_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final screen = const [
    TodayScreen(),
    AllScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        backgroundColor: Colors.green,
      ),

      body: SafeArea(
        child: screen[_index],
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            children: [
              // TODAY
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _index = 0),
                  child: Container(
                    color: _index == 0 ? Colors.green : Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.today, color: Colors.black),
                        Text("Today", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),
              // ALL
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _index = 1),
                  child: Container(
                    color: _index == 1 ? Colors.green : Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.list, color: Colors.black),
                        Text("All", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, size: 28),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTodoScreen()),
          );
        },
      ),
    );
  }
}
