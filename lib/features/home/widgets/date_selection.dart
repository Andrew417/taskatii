import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class DateSelection extends StatelessWidget {
  const DateSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          height: 100,
          width: 70,
          selectionColor: AppColors.blue,
          initialSelectedDate: DateTime.now(),
          selectedTextColor: Colors.white,
          dateTextStyle: TextStyles.getBody(
            fontweight: FontWeight.w700,
            fontSize: 22,
          ),
          dayTextStyle: TextStyles.getSmall(),
          monthTextStyle: TextStyles.getSmall(),
          onDateChange: (date) {},
        ),
      ],
    );
  }
}
