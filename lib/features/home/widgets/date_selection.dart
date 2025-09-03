import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home/widgets/task_card_UI.dart';

class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  String selectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DatePicker(
            DateTime.now(),
            height: 100,
            width: 70,
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.blue,
            selectedTextColor: Colors.white,
            dayTextStyle: TextStyles.getSmall(),
            monthTextStyle: TextStyles.getSmall(),
            dateTextStyle: TextStyles.getBody(fontweight: FontWeight.w600),
            onDateChange: (date) {
              setState(() {
                selectedDate = DateFormat("yyyy-MM-dd").format(date);
              });
            },
          ),
          Gap(20),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: LocalHelper.taskBox.listenable(),
              builder: (context, box, child) {
                List<TaskModel> tasks = [];
                for (var model in box.values) {
                  if (model.date == selectedDate) {
                    tasks.add(model);
                  }
                }
                if (tasks.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/images/empty.json', width: 300),
                        Text(
                          'No Tasks Found',
                          style: TextStyles.getBody(
                            fontweight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskCardUi(
                      task: tasks[index],
                      onComplete: () {
                        box.put(
                          tasks[index].id,
                          tasks[index].copyWith(isCompleted: true),
                        );
                      },
                      onDelete: () {
                        box.delete(tasks[index].id);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Gap(10),
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
