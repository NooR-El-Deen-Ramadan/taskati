// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import 'package:taskati/core/constants/images.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/functions/snakebar_messanger.dart';
import 'package:taskati/core/services/hive_provider.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/main_text_form_field.dart';
import 'package:taskati/features/home/pages/home_screen.dart';

class UplodeScreen extends StatefulWidget {
  const UplodeScreen({super.key});

  @override
  State<UplodeScreen> createState() => _UplodeScreenState();
}

class _UplodeScreenState extends State<UplodeScreen> {
  String? imagePath;
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              HiveProvider.cachUserData(HiveProvider.nameKey, nameController.text);
              HiveProvider.cachUserData(HiveProvider.imageKey, imagePath);
              if (imagePath != null && nameController.text.isNotEmpty) {
                HiveProvider.cachUserData(HiveProvider.isUploadKey, true);
                pushAndRemove(context: context, screen: HomeScreen());
              } else if (imagePath == null && nameController.text.isNotEmpty) {
                showSnackBar(
                  context: context,
                  message: "Please Uplode an Image",
                );
              } else if (imagePath != null && nameController.text.isEmpty) {
                showSnackBar(
                  context: context,
                  message: "Please Enter Your Name",
                );
              } else {
                showSnackBar(
                  context: context,
                  message: "Please Enter Your Name and Upload an Image",
                );
              }
            },
            child: Text(
              "Done",
              style: AppFontStyles.getMedium(fontColor: AppColors.primaryColor),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (imagePath != null)
                  ? ClipOval(
                      child: Image.file(
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                        File(imagePath!),
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 80,
                      backgroundImage: AssetImage(AppImages.userPNG),
                    ),
              Gap(20),
              MainButton(
                buttonText: "Uplode Image from Gallery",
                onPressed: () {
                  uplodeImage(false);
                },
              ),
              Gap(10),
              MainButton(
                buttonText: "Uplode Image from Camera",
                onPressed: () {
                  uplodeImage(true);
                },
              ),
              Gap(10),
              Divider(thickness: 2, color: AppColors.greyColor),
              Gap(20),
              MainTextFormField(
                textFormFieldText: "Enter Your Name",
                controller: nameController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void uplodeImage(bool isCamera) async {
    var imagePicker = ImagePicker();

    var pickedImage = await imagePicker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}
