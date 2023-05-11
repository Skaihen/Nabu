class Task {
  final String id;
  String title;
  String description;
  bool isCompleted = false;
  final DateTime insertedAt = DateTime.now();

  Task({
    required this.id,
    required this.title,
    this.description = '',
  });
}
