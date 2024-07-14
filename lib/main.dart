import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff7492b7)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
