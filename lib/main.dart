import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_manager_forcen/auth/login.dart';
import 'package:tasks_manager_forcen/routes/root_view.dart';

import 'api/blocs/task_bloc.dart';
import 'api/repository/task_repository.dart';

void main() {
  final TaskRepository taskRepository = TaskRepository(apiUrl: 'https://785f-41-82-27-233.ngrok-free.app');
  runApp(MyApp(taskRepository: taskRepository));
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository;
  const MyApp({super.key, required this.taskRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TaskBloc(taskRepository: taskRepository),
    child: const RootView()
    );
  }
}
