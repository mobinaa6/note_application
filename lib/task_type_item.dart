import 'package:flutter/material.dart';
import 'package:flutter_application_expp/task_type.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList(
      {Key? key,
      required this.tasktype,
      required this.index,
      required this.selectedTaskTypeitem})
      : super(key: key);
  TaskType tasktype;
  int index;
  int selectedTaskTypeitem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:
              index == selectedTaskTypeitem ? Colors.green : Colors.transparent,
          border: Border.all(
            color: index == selectedTaskTypeitem
                ? Colors.green
                : Colors.transparent,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(8),
      width: 140,
      child: Column(
        children: [
          Image.asset(tasktype.image),
          Text(tasktype.title),
        ],
      ),
    );
  }
}
