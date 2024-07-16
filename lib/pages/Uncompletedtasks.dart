import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tasks_manager_forcen/widgets/taskwidget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent),);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Row
              (mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.white, size: 30,
                ),
                Icon(Icons.notifications_outlined, color: Colors.white, size:30)
              ],
            ),
          ),
          body: Container(
            child: Column(
              children: [Container(
                alignment: Alignment.topLeft,
                child: const Text("Uncompleted tasks",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      //
                      color: Color(0xff112255)
                  ),
                ),
              ),
                Expanded(
                  child: ListView(
                    children: const [

                      Task(),
                      Task(),
                      Task(),
                      Task(),
                      Task()
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}