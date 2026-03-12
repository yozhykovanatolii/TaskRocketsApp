import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_rockets/dependencies.dart';
import 'package:task_rockets/presentation/bloc/rocket_cubit.dart';
import 'package:task_rockets/presentation/page/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Dependencies.setupDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I<RocketCubit>()..fetchData(),
        ),
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
