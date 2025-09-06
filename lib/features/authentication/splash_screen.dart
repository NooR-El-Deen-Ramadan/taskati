import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/animation.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/hive_provider.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/fonts.dart';
import 'package:taskati/features/authentication/uplode_screen.dart';
import 'package:taskati/features/home/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
void initState() {
  var isUplode=HiveProvider.getUserData( HiveProvider.isUploadKey )?? false;
  Future.delayed(Duration(seconds: 5),(){
    // ignore: use_build_context_synchronously
    pushWithReplacment(screen:isUplode?HomeScreen(): UplodeScreen(), context: context);
  }); 
   super.initState();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(AppAnimation.splashScreenAnimation, width: 700),
            Text("Taskatii", style: AppFontStyles.getBold()),
            Gap(10),
            Text(
              "It's time to get Organized",
              style: AppFontStyles.getRegular(fontColor: AppColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
