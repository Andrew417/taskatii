import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/task_colors.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/addTask/page/add_task.dart';

class TaskCardUi extends StatelessWidget {
  const TaskCardUi({
    super.key,
    required this.task,
    required this.onComplete,
    required this.onDelete,
  });

  final TaskModel task;
  final Function() onComplete;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onComplete();
        } else {
          onDelete();
        }
      },
      background: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.check, color: Colors.white),
            Gap(10),
            Text('Complete', style: TextStyles.getBody(color: Colors.white)),
          ],
        ),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete, color: Colors.white),
            Gap(10),
            Text('Delete', style: TextStyles.getBody(color: Colors.white)),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          pushTo(context, AddEditTaskScreen(taskModel: task));
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: task.isCompleted ? Colors.green : taskColors[task.color],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.getTitle(
                        fontweight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Gap(6),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white, size: 17),
                        Gap(6),
                        Text(
                          '${task.startTime} : ${task.endTime}',
                          style: TextStyles.getSmall(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    if (task.description?.isNotEmpty == true) ...[
                      Gap(6),
                      Text(
                        task.description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.getBody(color: Colors.white),
                      ),
                    ],
                  ],
                ),
              ),
              Gap(8),
              Container(width: 1, height: 60, color: Colors.white),
              Gap(5),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  task.isCompleted ? 'COMPLETED' : 'TODO',
                  style: TextStyles.getSmall(
                    color: Colors.white,
                    fontweight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
