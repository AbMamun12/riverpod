import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final textController = TextEditingController();
  DateTime? selectedDate;

  void pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: "Todo"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickDate,
              child: Text(selectedDate == null
                  ? "Selected Date"
                  : selectedDate.toString().substring(0, 10),
            ),
            ),
            const SizedBox(height: 40),
            
            ElevatedButton(onPressed: (){
              //Will complete after adding riverpod and database
            }, child: const Text("Save Todo"))

          ],
        ),
      ),
    );
  }
}
