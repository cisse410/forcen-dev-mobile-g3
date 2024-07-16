import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/task_card.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});
  static const String routeName = '/all-task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_task'); // Exemple de navigation vers une page d'ajout de tâche
        },
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Theme.of(context).primaryColor, // Couleur de fond du bouton flottant
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TaskCard(
            title: 'Task 1',
            description: 'Description of Task 1',
            isCompleted: false,
          ),
          const SizedBox(height: 16),
          TaskCard(
            title: 'Task 2',
            description: 'Description of Task 2',
            isCompleted: true,
          ),
          // Ajoutez ici d'autres cartes de tâches si nécessaire
        ],
      ),
    );
  }
}
