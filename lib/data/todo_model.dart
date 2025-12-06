class TodoModel {
  final String title;
  final DateTime date;
  final bool isCompleted;

  TodoModel({
    required this.title,
    required this.date,
    this.isCompleted = false,
  });

  TodoModel copyWith({
    String? title,
    DateTime? date,
    bool? isCompleted,
  }) {
    return TodoModel(
      title: title ?? this.title,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
