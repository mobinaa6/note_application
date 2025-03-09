import 'package:flutter/material.dart';
import 'package:flutter_application_expp/add_task_screen.dart';
import 'package:flutter_application_expp/home_screen.dart';
import 'package:flutter_application_expp/task.dart';
import 'package:flutter_application_expp/task_type.dart';
import 'package:flutter_application_expp/type_enum.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('names');
  Hive.registerAdapter(TaskAdapter());

  Hive.registerAdapter(TaskTypeAdapter());
  await Hive.openBox<Task>('taskBox');

  Hive.registerAdapter(TaskTypeEnumAdapter());

  runApp(Applcation());
}

class Applcation extends StatelessWidget {
  const Applcation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SM',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
