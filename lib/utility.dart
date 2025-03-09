import 'package:flutter_application_expp/task_type.dart';
import 'package:flutter_application_expp/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        taskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/social_frends.png',
        title: 'میتینگ',
        taskTypeEnum: TaskTypeEnum.date),
    TaskType(
        image: 'images/hard_working.png',
        title: 'کار زیاد',
        taskTypeEnum: TaskTypeEnum.working),
    TaskType(
        image: 'images/banking.png',
        title: 'کار بانکی',
        taskTypeEnum: TaskTypeEnum.workBank),
    TaskType(
        image: 'images/work_meeting.png',
        title: 'استراحت در کار',
        taskTypeEnum: TaskTypeEnum.stayAtWork),
    TaskType(
        image: 'images/workout.png',
        title: 'بسکتبال',
        taskTypeEnum: TaskTypeEnum.Basketbal)
  ];
  return list;
}
