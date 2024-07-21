import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String title;
  final String priority;
  final DateTime date;
  final TimeOfDay time;
  final String description;
  final bool isCompleted;

  const Task({
    super.key,
    required this.title,
    required this.priority,
    required this.date,
    required this.time,
    required this.isCompleted,
    required this.description,
  });

  static const String routeName = '/completed-tasks';

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 130,
      padding: const EdgeInsets.all(1.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 3,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                width: 65,
                height: 25,
                decoration: BoxDecoration(
                  color: _getPriorityColor(priority),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  priority,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 5),
                  const Icon(Icons.calendar_today_outlined, size: 30),
                  Text(
                    "${date.year}-${date.month}-${date.day}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                color: Colors.green,
                size: 28,
              ),
              const SizedBox(height: 50),
              Row(
                children: <Widget>[
                  const Icon(Icons.access_alarms, size: 30),
                  Text(
                    "${time.hour} : ${time.minute}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
