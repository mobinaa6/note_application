import 'package:flutter/material.dart';
import 'package:flutter_application_expp/task.dart';
import 'package:flutter_application_expp/task_type.dart';
import 'package:flutter_application_expp/task_type_item.dart';
import 'package:flutter_application_expp/utility.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  final TextEditingController ControllerTaskTitle = TextEditingController();
  final TextEditingController ControllerTaskSubTitle = TextEditingController();
  final box = Hive.box<Task>('taskBox');
  DateTime? _time;
  int _selectedTaskTypeitem = 0;
  String? imagesss;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    negahban1.addListener(() {
      setState(() {});
      negahban2.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: ControllerTaskTitle,
                  focusNode: negahban1,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    labelText: 'عنوان تسک',
                    labelStyle: TextStyle(
                      color: negahban1.hasFocus
                          ? Color(0xff18DAA3)
                          : Color(0xffC5C5C5),
                      fontSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xffC5C5C5),
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Color(0xff18DAA3), width: 3),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: ControllerTaskSubTitle,
                  maxLines: 2,
                  focusNode: negahban2,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    labelText: 'عنوان تسک',
                    labelStyle: TextStyle(
                      color: negahban2.hasFocus
                          ? Color(0xff18DAA3)
                          : Color(0xffC5C5C5),
                      fontSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xffC5C5C5),
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Color(0xff18DAA3), width: 3),
                    ),
                  ),
                ),
              ),
            ),
            _getTimePicker(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 180,
                child: ListView.builder(
                  ////////////////////////////
                  itemCount: getTaskTypeList().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTaskTypeitem = index;
                        });
                      },
                      child: TaskTypeItemList(
                        index: index,
                        selectedTaskTypeitem: _selectedTaskTypeitem,
                        tasktype: getTaskTypeList()[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff18DAA3),
                    minimumSize: Size(200, 48),
                  ),
                  onPressed: () {
                    String tasktitle = ControllerTaskTitle.text;
                    String tasSubktitle = ControllerTaskSubTitle.text;
                    addTask(tasktitle, tasSubktitle);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'اضافه کردن تسک',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _getTimePicker() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomHourPicker(
        title: 'زمان تسک رو انتخاب کن',
        negativeButtonText: 'حذف کن',
        positiveButtonText: 'انتخاب زمان',
        elevation: 2,
        onPositivePressed: (context, time) {
          _time = time;
        },
        onNegativePressed: (context) {},
        titleStyle: TextStyle(
            color: Color(0xff18DAA3),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        negativeButtonStyle: TextStyle(
            color: Color.fromARGB(255, 209, 40, 28),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        positiveButtonStyle: TextStyle(
            color: Color(0xff18DAA3),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  void addTask(String tasktitle, String taskSubTitle) {
    if (_time == null) {
      return;
    }
    var task = Task(
        title: tasktitle,
        subtitle: taskSubTitle,
        time: _time!,
        taskType: getTaskTypeList()[_selectedTaskTypeitem],
        selectedTaskTypeitem: _selectedTaskTypeitem);

    box.add(task);
  }
}
