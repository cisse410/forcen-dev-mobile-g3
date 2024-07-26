class TaskModel {
  final int? id;
  final String title;
  final String content;
  final String priority;
  final String color;
  final DateTime dueDate;

  TaskModel({
    this.id,
    required this.title,
    required this.content,
    required this.priority,
    required this.color,
    required this.dueDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      priority: json['priority'],
      color: json['color'],
      dueDate: DateTime.parse(json['dueDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'priority': priority,
      'color': color,
      'dueDate': dueDate.toIso8601String(),
    };
  }
}
