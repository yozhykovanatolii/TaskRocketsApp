import 'package:flutter/material.dart';
import 'package:task_rockets/presentation/page/home/home_page.dart';

void main() {
  runApp(const TaskRocketsApp());
}

class TaskRocketsApp extends StatelessWidget {
  const TaskRocketsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
