import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/components/buttons/main_btn.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/addTask/page/add_task.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: TextStyles.getTitle(),
              ),
              Text(
                DateFormat.EEEE().format(DateTime.now()),
                style: TextStyles.getTitle(),
              ),
            ],
          ),
        ),
        Gap(10),
        MainBtn(
          text: '+ Add Task',
          onPressed: () {
            pushTo(context, AddEditTaskScreen());
          },
          width: 138,
        ),
      ],
    );
  }
}
