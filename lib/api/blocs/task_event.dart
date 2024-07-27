// lib/blocs/task_event.dart

import 'package:tasks_manager_forcen/api/models/task_model.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class FetchTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final TaskModel task;
  AddTask(this.task);
}

class UpdateTask extends TaskEvent {
  final TaskModel task;
  UpdateTask(this.task);
}

class DeleteTask extends TaskEvent {
  final int taskId;
  DeleteTask(this.taskId);
}
