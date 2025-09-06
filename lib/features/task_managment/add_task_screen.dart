import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/snakebar_messanger.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_provider.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/main_text_form_field.dart';
import 'package:taskati/features/home/pages/home_screen.dart';
import 'package:taskati/features/home/widgets/date_and_time_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  //variables
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );
  TextEditingController startTimeController = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );
  TextEditingController endTimeController = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now().add(Duration(hours: 1))),
  );

  List<Color> colorList = [
    AppColors.primaryColor,
    AppColors.pinkColor,
    AppColors.orangeColor,
  ];

  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay(
    hour: TimeOfDay.now().hour,
    minute: (TimeOfDay.now().minute + 15),
  );
  int selectedColor = 0;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MainButton(
            buttonText: "Create Task",
            onPressed: () {
              if(formKey.currentState!.validate()){
              var id = DateTime.now().millisecondsSinceEpoch.toString();
              HiveProvider.cachTaskData(
                id, 
                TaskModel(
                  date: dateController.text,
                  startTime: startTimeController.text,
                  endTime: endTimeController.text,
                  colorIndex: selectedColor,
                  isCompleted: false,
                  id: id,
                  title: titleController.text,
                  description: descriptionController.text,
                ),
              );

              Navigator.pop(context, HomeScreen());
              showSnackBar(context: context, message: "Task Added Successfully");
              }
              
              
            },
          ),
        ),
      ),
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: AppFontStyles.getMedium(fontWeight: FontWeight.w600),
              ),
              Gap(5),
              MainTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
                controller: titleController,
                textFormFieldText: "Enter Title",
              ),
              Gap(20),
              Text(
                "Description",
                style: AppFontStyles.getMedium(fontWeight: FontWeight.w600),
              ),
              Gap(5),
              MainTextFormField(
                textFormFieldText: "Enter description",
                maxTextLines: 3,
                controller: descriptionController,
              ),
              Gap(20),
              dateSelection(),
              Gap(20),
              timeSelection(),
              Gap(40),
              Row(
                spacing: 10,
                children: List.generate(colorList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: colorList[index],
                      radius: 20,
                      child: selectedColor == index
                          ? Icon(Icons.check, color: AppColors.whiteColor)
                          : null,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column dateSelection() {
    return Column(
      children: [
        Text(
          "Date",
          style: AppFontStyles.getMedium(fontWeight: FontWeight.w600),
        ),
        Gap(5),
        DateAndTimeField(
          controller: dateController,
          icon: Icon(Icons.calendar_month),
          onTap: () async {
            var selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365 * 3)),
            );

            if (selectedDate != null) {
              setState(() {
                dateController.text = DateFormat(
                  "d-M-yyyy",
                ).format(selectedDate);
              });
            }
          },
        ),
      ],
    );
  }

  //missing end time validation
  Row timeSelection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start Time",
                style: AppFontStyles.getMedium(fontWeight: FontWeight.w600),
              ),
              Gap(5),
              DateAndTimeField(
                controller: startTimeController,
                icon: Icon(Icons.timer_outlined),
                onTap: () async {
                  var selectedStart = await showTimePicker(
                    context: context,
                    initialTime: selectedStartTime,
                  );
                  if (selectedStart != null) {
                    if (selectedStart.isBefore(TimeOfDay.now())) {
                      showSnackBar(
                        // ignore: use_build_context_synchronously
                        context: context,
                        message: "Start Time cant be in the past",
                      );
                      selectedStart = TimeOfDay(
                        hour: TimeOfDay.now().hour,
                        minute: TimeOfDay.now().minute,
                      );
                    }
                    setState(() {
                      selectedStartTime = selectedStart!;
                      startTimeController.text = selectedStart.format(
                        // ignore: use_build_context_synchronously
                        context,
                      );
                    });
                  }
                },
              ),
            ],
          ),
        ),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "End Time",
                style: AppFontStyles.getMedium(fontWeight: FontWeight.w600),
              ),
              Gap(5),
              DateAndTimeField(
                controller: endTimeController,
                icon: Icon(Icons.timer),
                onTap: () async {
                  final selectedEnd = await showTimePicker(
                    context: context,
                    initialTime: selectedStartTime,
                  );
                  if (selectedEnd != null) {
                    if (selectedEnd.isBefore(selectedStartTime)) {
                      showSnackBar(
                        // ignore: use_build_context_synchronously
                        context: context,
                        message: "End Time cant be before Start Time",
                      );
                    }
                    setState(() {
                      selectedEndTime = selectedEnd;
                      endTimeController.text = selectedEnd.format(
                        // ignore: use_build_context_synchronously
                        context,
                      );
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
