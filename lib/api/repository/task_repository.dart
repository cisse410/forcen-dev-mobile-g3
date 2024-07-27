// task_repository.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tasks_manager_forcen/api/models/task_model.dart';

class TaskRepository {
  final String apiUrl;

  TaskRepository({required this.apiUrl});

  Future<List<TaskModel>> fetchTasks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((task) => TaskModel.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> createTask(TaskModel task) async {
    print(" URIIII ${Uri.parse("$apiUrl/task")}");
    final response = await http.post(
      Uri.parse("$apiUrl/task"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(task.toJson()),
    );
    print(" STATUSCODEEEE ${response.statusCode}");

    if (response.statusCode != 201) {
      throw Exception('Failed to create task');
    }
  }

  Future<void> updateTask(TaskModel task) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${task.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(task.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTask(int taskId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$taskId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }
}
