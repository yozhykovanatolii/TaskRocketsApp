import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_rockets/presentation/bloc/rocket_cubit.dart';
import 'package:task_rockets/presentation/page/home/home_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RocketCubit()..fetchData()),
      ],
      child: const TaskRocketsApp(),
    ),
  );
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
