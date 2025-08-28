import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/components/buttons/main_btn.dart';
import 'package:taskati/core/extentions/dailogs.dart';
import 'package:taskati/core/extentions/navigation.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/features/home/page/homepage.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.semiWhite,
        actions: [
          TextButton(
            onPressed: () {
              if (path != null && nameController.text.isNotEmpty) {
                LocalHelper.cacheData(LocalHelper.isUpload, true);
                LocalHelper.cacheData(LocalHelper.kImage, path);
                LocalHelper.cacheData(LocalHelper.kName, nameController.text);
                pushWithReplacement(context, HomePage());
              } else if (path != null && nameController.text.isEmpty) {
                showErrorDialog(context, 'Please enter your name');
              } else if (path == null && nameController.text.isNotEmpty) {
                showErrorDialog(context, 'Please upload your profile image');
              } else {
                showErrorDialog(
                  context,
                  'Please enter your name and upload your profile image',
                );
              }
            },
            child: Text('Done'),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.blue,
                  backgroundImage: path != null
                      ? FileImage(File(path ?? ''))
                      : AssetImage('assets/images/accountPng.png'),
                ),
                SizedBox(height: 25),
                MainBtn(
                  width: 250,
                  text: 'Upload From Camera',
                  onPressed: () {
                    uploadImage(true);
                  },
                ),
                SizedBox(height: 10),
                MainBtn(
                  width: 250,
                  text: 'Upload From Gallery',
                  onPressed: () async {
                    uploadImage(false);
                  },
                ),
                SizedBox(height: 25),
                Divider(),
                SizedBox(height: 25),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Enter your name'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadImage(bool isCamera) async {
    var picker = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (picker != null) {
      setState(() {
        path = picker.path;
      });
    }
  }
}
