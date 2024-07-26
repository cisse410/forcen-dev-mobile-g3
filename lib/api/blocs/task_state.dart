// lib/blocs/task_state.dart

import 'package:tasks_manager_forcen/api/models/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;
  TaskLoaded({required this.tasks});
}

class TaskError extends TaskState {
  final String message;
  TaskError({required this.message});
}
