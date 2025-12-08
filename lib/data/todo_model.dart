class TodoModel {
  final int? id;
  final String title;
  final DateTime date;
  bool isCompleted;  // 🔹 এখানে final সরিয়ে দিলাম

  TodoModel({
    this.id,
    required this.title,
    required this.date,
    this.isCompleted = false,
  });
}
