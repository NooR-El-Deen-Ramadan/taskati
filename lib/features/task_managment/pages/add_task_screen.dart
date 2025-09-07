import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/task_colors.dart';
import 'package:taskati/core/functions/snakebar_messanger.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_provider.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/main_text_form_field.dart';
import 'package:taskati/features/task_managment/widgets/date_and_time_field.dart';

class AddAndEditTaskScreen extends StatefulWidget {
  const AddAndEditTaskScreen({super.key, this.task});
  final TaskModel? task;

  @override
  State<AddAndEditTaskScreen> createState() => _AddAndEditTaskScreenState();
}

class _AddAndEditTaskScreenState extends State<AddAndEditTaskScreen> {
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

  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay(
    hour: TimeOfDay.now().hour,
    minute: (TimeOfDay.now().minute + 15),
  );
  int selectedColor = 0;

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    titleController.text = widget.task?.title ?? "";
    descriptionController.text = widget.task?.description ?? "";
    dateController.text = widget.task?.date ?? dateController.text;
    startTimeController.text =
        widget.task?.startTime ?? startTimeController.text;
    endTimeController.text = widget.task?.endTime ?? endTimeController.text;
    selectedColor = widget.task?.colorIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MainButton(
            buttonText: widget.task == null ? "Create Task" : "Update Task",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String id = " ";
                if (widget.task != null) {
                  id = widget.task!.id;
                  Navigator.pop(context);
                } else {
                  id =
                      widget.task?.id ??
                      DateTime.now().millisecondsSinceEpoch.toString();
                  Navigator.pop(context);
                }

                HiveProvider.cachTaskData(
                  id,
                  TaskModel(
                    date: dateController.text,
                    startTime: startTimeController.text,
                    endTime: endTimeController.text,
                    colorIndex: selectedColor,
                    isCompleted: widget.task?.isCompleted ?? false,
                    id: id,
                    title: titleController.text,
                    description: descriptionController.text,
                  ),
                );

                // Navigator.pop(context, HomeScreen(nameController:));
                showSnackBar(
                  context: context,
                  message: "Task Added Successfully",
                );
              }
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(widget.task == null ? "Add Task" : "Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fillTaskData(),
              Gap(20),
              dateSelection(),
              Gap(20),
              timeSelection(),
              Gap(40),
              colorSelection(),
            ],
          ),
        ),
      ),
    );
  }

  Column fillTaskData() {
    return Column(
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
              ],
            );
  }

  Row colorSelection() {
    return Row(
              spacing: 10,
              children: List.generate(taskColors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: taskColors[index],
                    radius: 20,
                    child: selectedColor == index
                        ? Icon(Icons.check, color: AppColors.whiteColor)
                        : null,
                  ),
                );
              }),
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
                  "yyyy-MM-dd",
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
