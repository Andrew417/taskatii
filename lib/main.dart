import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/features/splash_screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: 'Poppins',
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: Splash(),
    );
  }
}
