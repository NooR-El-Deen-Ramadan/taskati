import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/constants/images.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/hive_provider.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';
import 'package:taskati/features/user_management/pages/profile_screen.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${HiveProvider.getUserData(HiveProvider.nameKey).split(" ")[0]}",
                style: AppFontStyles.getSemiBold(
                  fontColor: AppColors.primaryColor,
                ),
              ),
              Text(
                "Have A Nice Day",
                style: AppFontStyles.getMedium(fontColor: AppColors.darkColor),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            pushWithoutReplacment(
              context: context,
              screen: ProfileScreen(),
            ).then((value) => setState(() {}));
          },
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 28,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.primaryColor,
              backgroundImage:
                  HiveProvider.getUserData(HiveProvider.imageKey) != null
                  ? FileImage(
                      File(HiveProvider.getUserData(HiveProvider.imageKey)),
                    )
                  : AssetImage(AppImages.userPNG),
            ),
          ),
        ),
      ],
    );
  }
}
