import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/components/buttons/main_btn.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? path;
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var isDark = LocalHelper.getData(LocalHelper.kIsDark) ?? false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              LocalHelper.cacheData(LocalHelper.kIsDark, !isDark);
              setState(() {});
            },
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            MainBtn(
                              width: 370,
                              text: 'Upload From Camera',
                              onPressed: () {
                                uploadImage(true);
                              },
                            ),
                            Gap(10),
                            MainBtn(
                              width: 370,
                              text: 'Upload From Gallery',
                              onPressed: () async {
                                uploadImage(false);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  backgroundImage:
                      LocalHelper.getData(LocalHelper.kImage) != null
                      ? FileImage(File(LocalHelper.getData(LocalHelper.kImage)))
                      : AssetImage('assets/images/accountPng.png'),
                  radius: 80,
                ),
              ),

              Gap(30),
              Divider(),
              Gap(8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      LocalHelper.getData(LocalHelper.kName),
                      style: TextStyles.getTitle(
                        color: AppColors.blue,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(controller: nameController),
                                Gap(20),
                                MainBtn(
                                  text: 'Update Your Name',
                                  onPressed: () {
                                    setState(() {
                                      LocalHelper.cacheData(
                                        LocalHelper.kName,
                                        nameController.text,
                                      );
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit, color: AppColors.blue),
                  ),
                ],
              ),
            ],
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
