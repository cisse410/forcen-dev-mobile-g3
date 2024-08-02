import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tasks_manager_forcen/api/models/task_model.dart';

class TaskRepository {
  final String apiUrl;

  TaskRepository({this.apiUrl = 'https://785f-41-82-27-233.ngrok-free.app/task'});

  Future<List<TaskModel>> fetchTasks() async {
    print("Fetching tasks from $apiUrl");
    final response = await http.get(Uri.parse("$apiUrl/task"));
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<TaskModel> tasks = jsonResponse.map((task) => TaskModel.fromJson(task)).toList();
      // Trier les tâches par ordre décroissant de date de création
      tasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return tasks;
    } else {
      throw Exception('Failed to load tasks: ${response.reasonPhrase}');
    }
  }

  Future<void> createTask(TaskModel task) async {
    final response = await http.post(
      Uri.parse("$apiUrl/task"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(task.toJson()),
    );
    print("Create task response status: ${response.statusCode}");
    print("Create task response body: ${response.body}");

    if (response.statusCode != 201) {
      throw Exception('Failed to create task: ${response.reasonPhrase}');
    }
  }

  /*Future<TaskModel> updateTask(TaskModel task) async {
    // Simuler une attente pour la mise à jour
    await Future.delayed(Duration(seconds: 1));
    // Retournez la tâche mise à jour (dans un vrai scénario, vous auriez une réponse de l'API)
    return task;
  }*/

  Future<TaskModel> updateTask(TaskModel task) async {
    final response = await http.patch(
      Uri.parse('$apiUrl/task/${task.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(task.toJson()),
    );
    print("Update task response status: ${response.statusCode}");
    print("Update task response body: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception('Failed to update task: ${response.reasonPhrase}');
    }
    return task;
  }

  Future<void> deleteTask(int taskId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/task/$taskId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Delete task response status: ${response.statusCode}");
    print("Delete task response body: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task: ${response.reasonPhrase}');
    }
  }
}
