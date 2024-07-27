import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasks_manager_forcen/widgets/app_bar.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/task_widget.dart';
import 'detail_task_page.dart';
import 'package:http/http.dart' as http;

class TasksPage extends StatefulWidget {
  final String title;
  const TasksPage({super.key, required this.title});
  static const String routeName = '/completed-tasks';

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  String searchQuery = '';
  String priorityFilter = 'All';

  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Task 1',
      'priority': 'Low',
      'date': '2024-07-21',
      'time': '14:00',
      'isCompleted': false,
      'description': "Description"
    },
    {
      'title': 'Task 2',
      'priority': 'High',
      'date': '2024-07-22',
      'time': '16:00',
      'isCompleted': true,
      'description': "Description"
    },
    {
      'title': 'Task 3',
      'priority': 'Medium',
      'date': '2024-07-23',
      'time': '18:00',
      'isCompleted': true,
      'description': "Description"
    },
    {
      'title': 'Task 4',
      'priority': 'Medium',
      'date': '2024-07-23',
      'time': '18:00',
      'isCompleted': false,
      'description': "Description"
    },
    {
      'title': 'Task 5',
      'priority': 'Medium',
      'date': '2024-07-23',
      'time': '18:00',
      'isCompleted': true,
      'description': "Description"
    },
  ];
  Future<void> _deleteTask(String title)

async {
    final url =
        Uri.parse('http://localhost:3000/api-docs#/Task/TaskController_remove');
    final response = await
    http.delete(url);
    if (response.statusCode == 200) {
      setState(() {
        tasks.removeWhere((task) => task["title"] == title
        );
      });
    } else {
      print("Erreur while deleting");
    }
}
  List<Map<String, dynamic>> get filteredTasks {
    return tasks.where((task) {
      final matchesSearchQuery = task['title'].toLowerCase().contains(searchQuery.toLowerCase());
      final matchesPriorityFilter = priorityFilter == 'All' || task['priority'] == priorityFilter;
      return matchesSearchQuery && matchesPriorityFilter;
    }).toList();
  }

  TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-task'); // Exemple de navigation vers une page d'ajout de tâche
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white,), // Couleur de fond du bouton flottant
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), // Ajustez le rayon ici
        ),
        elevation: 10.0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search tasks...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  "Filter by priority: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff112255),
                  ),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: priorityFilter,
                  items: <String>['All', 'High', 'Medium', 'Low']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      priorityFilter = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                return Slidable(
                  key: ValueKey(task['title']),
                  endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [SlidableAction(
                          onPressed: (context) => _deleteTask(task['title']!),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      ],
                  ),
                  child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailPage(
                          title: task['title'],
                          description: 'description',
                          date: DateTime.parse(task['date']),
                          time: _parseTime(task['time']),
                          isCompleted: task['isCompleted'],
                          priority: task['priority'],
                        ),
                      ),
                    );
                  },
                  child: Task(
                    title: task['title'],
                    priority: task['priority'],
                    date: DateTime.parse(task['date']),
                    time: _parseTime(task['time']),
                    isCompleted: task['isCompleted'],
                    description: '',
                  ),
                  ),
                );
                },
            ),
          ),
        ],
      ),
    );
  }
}
