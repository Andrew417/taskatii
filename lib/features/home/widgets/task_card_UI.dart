import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class TaskCardUi extends StatefulWidget {
  const TaskCardUi({super.key});

  @override
  State<TaskCardUi> createState() => _TaskCardUiState();
}

class _TaskCardUiState extends State<TaskCardUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.blue,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Title',
                  style: TextStyles.getTitle(color: Colors.white),
                ),
                Gap(5),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white, size: 17),
                    Gap(10),
                    Text(
                      '7:00 - 7:00',
                      style: TextStyles.getSmall(color: Colors.white),
                    ),
                  ],
                ),
                Gap(5),
                Text(
                  'Description',
                  style: TextStyles.getSmall(color: Colors.white),
                ),
              ],
            ),
          ),
          Gap(8),
          Container(width: 1, height: 60, color: Colors.white),
          Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Completed',
              // task.isCompleted ? 'COMPLETED' : 'TODO',
              style: TextStyles.getSmall(
                color: Colors.white,
                fontweight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
