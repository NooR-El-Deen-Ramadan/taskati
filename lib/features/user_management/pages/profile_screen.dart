import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/images.dart';
import 'package:taskati/core/services/hive_provider.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/main_text_form_field.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.name});
  final String name;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final savedName = HiveProvider.getUserData(HiveProvider.nameKey);
    if (savedName is String && savedName.isNotEmpty) {
      nameController.text = savedName;
    } else {
      nameController.text = widget.name;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> pickImage(bool isCamera) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (picked != null) {
      HiveProvider.cachUserData(HiveProvider.imageKey, picked.path);
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Image updated')));
      setState(() {});
    }
  }

  void showImageSourceSheet() {
    showModalBottomSheet(
      elevation: 3,
      context: context,
      builder: (context) {
        return SafeArea(
          child: SizedBox(
            height: 170,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Gap(10),
                  ListTile(
                    leading: const Icon(
                      Icons.photo_library,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      'Gallery',
                      style: AppFontStyles.getRegular(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(false);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.photo_camera,
                      color: AppColors.primaryColor,
                    ),
                    title: Text(
                      'Camera',
                      style: AppFontStyles.getRegular(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(true);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var isDark = HiveProvider.getUserData(HiveProvider.isDarkKey) ?? false;
    final String? imagePath = HiveProvider.getUserData(HiveProvider.imageKey);
    final ImageProvider avatarImage =
        (imagePath != null && File(imagePath).existsSync())
        ? FileImage(File(imagePath))
        : AssetImage(AppImages.userPNG);
    return Scaffold(
      body: Center(
        child: Scaffold(
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 65),
              child: MainButton(
                buttonText: "Save",
                onPressed: () {
                  final newName = nameController.text;
                  if (newName.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Name cannot be empty')),
                    );
                    return;
                  }
                  HiveProvider.cachUserData(HiveProvider.nameKey, newName);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Name updated')));
                  setState(() {});
                },
              ),
            ),
          ),
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: IconButton(
                  onPressed: () {
                   
                    HiveProvider.cachUserData(HiveProvider.isDarkKey, !isDark);
                    setState(() {});
                  },
                  icon: Icon(!isDark ? Icons.dark_mode_rounded : Icons.sunny),
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
                        backgroundImage: avatarImage,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: showImageSourceSheet,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.whiteColor,
                            child: Icon(
                              Icons.camera_alt,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  Divider(),
                  Gap(30),

                  MainTextFormField(
                    textFormFieldText: 'Enter Your Name',
                    controller: nameController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
