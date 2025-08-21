import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskati/components/buttons/main_btn.dart';
import 'package:taskati/core/utils/app_colors.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.semiWhite,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Done', style: TextStyle(color: AppColors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.blue,
              radius: 90,
              child: SvgPicture.asset(
                'assets/images/accountSvg.svg',
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(height: 25),
            MainBtn(text: 'Upload From Camera', onPressed: () {}),
            SizedBox(height: 8),
            MainBtn(text: 'Upload From Gallery', onPressed: () {}),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your name'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'name cannot be empty';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
