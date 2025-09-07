import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/task_colors.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';
import 'package:taskati/features/task_managment/pages/add_task_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onCompletedTak,
    required this.onDeleteTask,
  });
  final TaskModel task;
  final Function() onCompletedTak;
  final Function() onDeleteTask;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onCompletedTak();
        } else {
          onDeleteTask();
        }
      },
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Completed",
                style: AppFontStyles.getRegular(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.whiteColor,
                ),
              ),
              Icon(Icons.check, color: AppColors.whiteColor),
            ],
          ),
        ),
      ),

      secondaryBackground: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Delete",
              style: AppFontStyles.getRegular(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontColor: AppColors.whiteColor,
              ),
            ),
            Icon(Icons.delete, color: AppColors.whiteColor),
          ],
        ),
      ),

      child: GestureDetector(
        onTap: () {
          pushWithoutReplacment(
            context: context,
            screen: AddAndEditTaskScreen(task: task),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),

          decoration: BoxDecoration(
            color: task.isCompleted
                ? AppColors.greenColor
                : taskColors[task.colorIndex],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFontStyles.getSemiBold(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                        ),
                      ),
                      Gap(5),

                      Row(
                        children: [
                          Icon(Icons.timer, color: AppColors.whiteColor),
                          Gap(5),
                          Text(
                            "${task.startTime} : ${task.endTime}",
                            style: AppFontStyles.getRegular(
                              fontSize: 15,
                              fontColor: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(5),

                      Text(
                        (task.description?.isEmpty == true)
                            ? ''
                            : task.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppFontStyles.getRegular(
                          fontSize: 15,
                          fontColor: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(5),
                Container(width: 1, height: 90, color: AppColors.whiteColor),
                Gap(5),
                RotatedBox(
                  quarterTurns: 3,

                  child: task.isCompleted
                      ? Text(
                          "Done",
                          style: AppFontStyles.getRegular(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.whiteColor,
                          ),
                        )
                      : Text(
                          "To Do",
                          style: AppFontStyles.getRegular(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.whiteColor,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
