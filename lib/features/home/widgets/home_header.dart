  import 'dart:io';

  import 'package:flutter/material.dart';
  import 'package:taskati/core/extentions/navigation.dart';
  import 'package:taskati/core/services/local_helper.dart';
  import 'package:taskati/core/utils/app_colors.dart';
  import 'package:taskati/core/utils/text_styles.dart';
  import 'package:taskati/features/profile/page/profile_screen.dart';

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
                  LocalHelper.getData(LocalHelper.kName),
                  style: TextStyles.getTitle(color: AppColors.blue),
                ),
                Text(
                  'Have a nice day',
                  style: TextStyles.getSmall(color: AppColors.grey),
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: 25,
            child: GestureDetector(
              onTap: () {
                pushTo(context, ProfileScreen()).then((value) => setState(() {}));
              },
              child: CircleAvatar(
                backgroundImage: LocalHelper.getData(LocalHelper.kImage) != null
                    ? FileImage(File(LocalHelper.getData(LocalHelper.kImage)))
                    : AssetImage('assets/images/accountPng.png'),
                radius: 20,
              ),
            ),
          ),
        ],
      );
    }
  }
