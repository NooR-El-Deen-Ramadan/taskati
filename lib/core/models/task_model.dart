// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part "task_model.g.dart";

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String startTime;
  @HiveField(5)
  final String endTime;
  @HiveField(6)
  final int colorIndex;
  @HiveField(7)
  final bool isCompleted;

  TaskModel({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.colorIndex,
    required this.isCompleted,
    required this.id,
    required this.title,
     this.description,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    String? startTime,
    String? endTime,
    int? colorIndex,
    bool? isCompleted,
  }) {
    return TaskModel(
      id:this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      colorIndex: colorIndex ?? this.colorIndex,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
