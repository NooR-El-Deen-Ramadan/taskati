import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/services/hive_provider.dart';

import 'package:taskati/core/utils/theme.dart';
import 'package:taskati/features/authentication/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveProvider.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveProvider.userBox.listenable(),
      builder: (context, box, child) {
        bool isDark = HiveProvider.getUserData(HiveProvider.isDarkKey)??false;
        return MaterialApp(
        themeMode: isDark? ThemeMode.dark:ThemeMode.light ,
theme:  AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
      },
       
    );
  }
}
