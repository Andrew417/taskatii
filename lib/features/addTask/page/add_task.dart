import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/components/buttons/main_btn.dart';
import 'package:taskati/core/constants/task_colors.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/addTask/widgets/TimeFieldSelection.dart';

class AddEditTaskScreen extends StatefulWidget {
  const AddEditTaskScreen({super.key});

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();

  int selectedColor = 0;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Task',
            style: TextStyles.getTitle(color: AppColors.blue),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MainBtn(
            height: 55,
            text: 'button',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleField(),
                Gap(12),
                descriptionField(),
                Gap(12),
                dateSelection(),
                Gap(12),
                timeSelection(),
                Gap(12),
                colorSelection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column titleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Title', style: TextStyles.getBody(fontweight: FontWeight.w600)),
        Gap(6),
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(hintText: 'Enter title'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter title';
            }
            return null;
          },
        ),
      ],
    );
  }

  Column descriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyles.getBody(fontweight: FontWeight.w600),
        ),
        Gap(6),
        TextFormField(
          controller: descriptionController,
          maxLines: 3,
          decoration: InputDecoration(hintText: 'Enter description ...'),
        ),
      ],
    );
  }

  Column colorSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: TextStyles.getBody(fontweight: FontWeight.w600)),
        Gap(6),
        Row(
          spacing: 5,
          children: List.generate(taskColors.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = index;
                });
              },
              child: CircleAvatar(
                backgroundColor: taskColors[index],
                child: (selectedColor == index)
                    ? Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }

  Column dateSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date', style: TextStyles.getBody(fontweight: FontWeight.w600)),
        Gap(6),
        TextFormField(
          controller: dateController,
          onTap: () async {
            var selectedDate = await showDatePicker(
              context: context,

              firstDate: DateTime.now(),
              initialDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365 * 3)),
            );
            if (selectedDate != null) {
              dateController.text = DateFormat(
                "yyyy-MM-dd",
              ).format(selectedDate);
            }
          },
          readOnly: true,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_month, color: AppColors.blue),
          ),
        ),
      ],
    );
  }

  Row timeSelection() {
    return Row(
      children: [
        TimeFieldSelection(
          controller: startTimeController,
          text: 'Start Time',
          onTap: () async {
            var selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (selectedTime != null) {
              startTimeController.text = selectedTime.format(context);
              // var startTime = DateFormat(
              //   "hh:mm:ss a",
              // ).parse(startTimeController.text);
            }
          },
        ),
        Gap(8),
        TimeFieldSelection(
          controller: endTimeController,
          text: 'End Time',
          onTap: () async {
            var selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (selectedTime != null) {
              endTimeController.text = selectedTime.format(context);
            }
          },
        ),
      ],
    );
  }
}
