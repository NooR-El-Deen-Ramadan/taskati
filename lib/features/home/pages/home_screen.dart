import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/task_managment/widgets/task_builder.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key,  this.nameController});
TextEditingController? nameController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              Gap(20),
              
              
              TaskBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
