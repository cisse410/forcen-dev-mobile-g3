import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
  });

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
                color: Colors.black
            ),
            borderRadius: BorderRadius.circular(20)
        ),
      child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [ Column( mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [const Text("Task 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(height: 15),
          Container( alignment: Alignment.center,
            width: 65, height: 25,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text("Low", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold
            ),
            ),
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              SizedBox(width: 5,),
              Icon(Icons.calendar_today_outlined, size: 30),
              Text("date", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Icon(Icons.check_box, color: Colors.green, size: 28,),
            SizedBox(height: 50,),
            Row(
              children: <Widget> [
                Icon( Icons.access_alarms, size: 30),
                Text("heure", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            )
          ],
        )
        ],
      ),
    );
  }
}