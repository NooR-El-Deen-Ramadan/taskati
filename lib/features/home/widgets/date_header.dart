
import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/task_managment/add_task_screen.dart';

// ignore: must_be_immutable
class DateHeader extends StatefulWidget {
  String selectedDate;

  DateHeader({super.key,
  required this.selectedDate 
  });

  @override
  State<DateHeader> createState() => _DateHeaderState(
    
  );
}

class _DateHeaderState extends State<DateHeader> {
  //where to store the selected date?
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat("d MMMM yyyy").format(DateTime.parse(widget.selectedDate)),
                    style: AppFontStyles.getSemiBold(
                      fontColor: AppColors.darkColor,
                    ),
                  ),
                  Text(
                    DateFormat("EEEE").format(DateTime.parse(widget.selectedDate)),
                    style: AppFontStyles.getSemiBold(
                      fontColor: AppColors.darkColor,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            MainButton(
              buttonText: "+ Add Task",
              onPressed: () {
                pushWithoutReplacment(
                  context: context,
                  screen: AddTaskScreen(),
                );
              },
              width: 155,
            ),
          ],
        ),
        Gap(30),
        DatePicker(
          height: 100,
          width: 70,
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primaryColor,
          selectedTextColor: AppColors.whiteColor,
          onDateChange: (date) {
            setState(() {
              widget.selectedDate = DateFormat("yyyy-MM-dd").format(date);
            });

            log("Selected Date: ${widget.selectedDate}");
            },
        ),
      ],
    );
  }
}
