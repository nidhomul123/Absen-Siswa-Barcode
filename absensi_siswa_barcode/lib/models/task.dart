class Task {
  final String taskName;
  final String description;
  final DateTime taskTime;
  final bool isDone;

  Task(
    this.taskName,
    this.description,
    this.taskTime,
    this.isDone,
  );
}

List<Task> listTask = [
  Task(
    'Olahraga',
    'Senam 30 menit',
    DateTime(2022, 9, 26, 7, 30),
    false,
  ),
];