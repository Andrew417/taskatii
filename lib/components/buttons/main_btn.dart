import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';

class MainBtn extends StatelessWidget {
  const MainBtn({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 45,
    required this.onPressed,
  });

  final String text;
  final double width;
  final double height;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: AppColors.semiWhite)),
      ),
    );
  }
}
