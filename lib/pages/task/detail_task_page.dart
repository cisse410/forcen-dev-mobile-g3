import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tasks_manager_forcen/constants/app_colors.dart';

import 'edit_task_page.dart';

class TaskDetailPage extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final String priority;
  final DateTime createdAt;

  const TaskDetailPage({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
    required this.createdAt,
  });
  static const String routeName = '/task-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTaskPage(
                    id: id,
                    title: title,
                    description: description,
                    date: date,
                    time: time,
                    priority: priority,
                    createdAt: '',
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share('Check out this task: $title\n\n$description');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff112255),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              id.toString(),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff112255),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: AppColors.kPrimaryColor),
                const SizedBox(width: 8),
                Text(
                  "${date.toLocal()}".split(' ')[0],
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, color: AppColors.kPrimaryColor),
                const SizedBox(width: 8),
                Text(
                  time.format(context),
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.priority_high, color: AppColors.kPrimaryColor),
                const SizedBox(width: 8),
                Text(
                  'Priority: $priority',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 16),
            /*Row(
              children: [
                Icon(
                  isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: isCompleted ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  isCompleted ? 'Completed' : 'Not Completed',
                  style: TextStyle(
                    fontSize: 16,
                    color: isCompleted ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
