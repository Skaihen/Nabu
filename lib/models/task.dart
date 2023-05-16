class Task {
  final String id;
  String title;
  bool isCompleted;
  final DateTime insertedAt;

  Task(
      {required this.id,
      this.title = '',
      this.isCompleted = false,
      required this.insertedAt});
}
