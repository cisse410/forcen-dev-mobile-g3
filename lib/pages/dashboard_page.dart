import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/pages/profile/profile_page.dart';
import 'package:tasks_manager_forcen/pages/task/tasks_page.dart';
import 'package:tasks_manager_forcen/widgets/app_bar.dart';
import 'package:tasks_manager_forcen/widgets/app_drawer.dart';
import 'package:flutter_echarts/flutter_echarts.dart' as charts;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  final _pages = [
    const DashboardPage(),
    const TasksPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Résumé des tâches
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TaskSummaryWidget(
                    title: 'Total Tasks',
                    count: 20,
                    color: Colors.blue,
                  ),
                  TaskSummaryWidget(
                    title: 'Completed',
                    count: 15,
                    color: Colors.green,
                  ),
                  TaskSummaryWidget(
                    title: 'In Progress',
                    count: 3,
                    color: Colors.orange,
                  ),
                  TaskSummaryWidget(
                    title: 'Overdue',
                    count: 2,
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Graphique des priorités
              /*Text(
                'Task Priorities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),*/
              //const SizedBox(height: 300, child: TaskPriorityChart()),
              SizedBox(height: 20),
              // Liste des tâches récentes
              Text(
                'Recent Tasks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RecentTasksWidget(),
              SizedBox(height: 20),
              // Calendrier des tâches
              /*Text(
                'Task Calendar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 400, child: TaskCalendarWidget()),*/
            ],
          ),
        ),
      ),
    );
  }
}

class TaskSummaryWidget extends StatelessWidget {
  const TaskSummaryWidget({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  final String title;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/*
class TaskPriorityChart extends StatelessWidget {
  const TaskPriorityChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final data = [
      TaskPriority('High', 5, Colors.red),
      TaskPriority('Medium', 8, Colors.orange),
      TaskPriority('Low', 7, Colors.green),
    ];

    final series = [
      charts.Series<TaskPriority, String>(
        id: 'Tasks',
        domainFn: (TaskPriority task, _) => task.priority,
        measureFn: (TaskPriority task, _) => task.count,
        colorFn: (TaskPriority task, _) => charts.ColorUtil.fromDartColor(task.color),
        data: data,
      ),
    ];

    return charts.PieChart(
      series,
      animate: true,
      animationDuration: const Duration(seconds: 1),
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.inside,
          ),
        ],
      ),
    );
  }
}
*/

class TaskPriority {
  final String priority;
  final int count;
  final Color color;

  TaskPriority(this.priority, this.count, this.color);
}

class RecentTasksWidget extends StatelessWidget {
  const RecentTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5, // Example: 5 recent tasks
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Task ${index + 1}'),
          subtitle: const Text('Task description goes here'),
          trailing: const Icon(Icons.check_circle, color: Colors.green),
        );
      },
    );
  }
}

class TaskCalendarWidget extends StatelessWidget {
  const TaskCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Calendar view goes here'),
    );
  }
}
