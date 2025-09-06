import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/task_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
