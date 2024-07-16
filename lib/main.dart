import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/auth/login.dart';
import 'package:tasks_manager_forcen/routes/root_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RootView();
  }
}
