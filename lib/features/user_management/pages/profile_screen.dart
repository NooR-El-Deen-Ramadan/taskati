import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/images.dart';
import 'package:taskati/core/services/hive_provider.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/main_text_form_field.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.name});
  final String name;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = HiveProvider.getUserData(
                      HiveProvider.isDarkKey,
                    )??false;
    return Scaffold(
      body: Center(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: IconButton(
                  onPressed: () {
                   
                    HiveProvider.cachUserData(HiveProvider.isDarkKey, !isDark);
                    setState(() {});
                  },
                  icon: Icon(!isDark? Icons.dark_mode_rounded:Icons.sunny),
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.chevron_left_sharp, size: 35),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 120,
                        child: Image.asset(AppImages.userPNG),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.whiteColor,

                          child: Icon(
                            Icons.camera_alt,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  Divider(),
                  Gap(30),

                  MainTextFormField(textFormFieldText: widget.name),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
