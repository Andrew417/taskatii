import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/features/home/upload_image.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      pushWithReplacement(context, UploadScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/logo.json'),
            Text(
              'Taskati',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'It\'s Time to Get Organized',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
