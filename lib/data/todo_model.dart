class TodoModel {
  final int?id;
  final String title;
  final DateTime date;
  final bool isCompleted;

  TodoModel( {this.id,
    required this.title,
    required this.date,
    this.isCompleted = false,
  });

  TodoModel copyWith({
    int? id,
    String? title,
    DateTime? date,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
