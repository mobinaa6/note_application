import 'package:flutter_application_expp/task_type.dart';
import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  Task(
      {required this.title,
      required this.subtitle,
      this.isDone = false,
      required this.time,
      required this.taskType,
      required this.selectedTaskTypeitem});

  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  bool isDone;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  TaskType taskType;

  @HiveField(5)
  int selectedTaskTypeitem;
}
