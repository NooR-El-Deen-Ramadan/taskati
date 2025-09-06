import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/animation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_provider.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/home/widgets/date_header.dart';

import 'package:taskati/features/home/widgets/task_card.dart';

class TaskBuilder extends StatefulWidget {
  const TaskBuilder({super.key});

  @override
  State<TaskBuilder> createState() => _TaskBuilderState();
}

class _TaskBuilderState extends State<TaskBuilder> {
  String selectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DateHeader(selectedDate: selectedDate),
          Gap(50),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: HiveProvider.taskBox.listenable(),
              builder: (context, box, child) {
                List<TaskModel> tasks = box.values.toList().cast<TaskModel>();
                for (var model in box.values) {
                  if (model.date == selectedDate) {
                    tasks.add(model);
                  }
                }
                if (tasks.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          AppAnimation.emptyListAnimation,
                          width: 400,
                        ),
                        Text(
                          "No Tasks Yet,please add some tasks!!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: tasks[index],
                      onCompletedTak: () {
                        box.put(
                          tasks[index].id,
                          tasks[index].copyWith(isCompleted: true),
                        );
                      },
                      onDeleteTask: () {
                        box.delete(tasks[index].id);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Gap(10),
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
