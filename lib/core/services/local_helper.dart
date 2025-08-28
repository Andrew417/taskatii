import 'package:hive_flutter/hive_flutter.dart';

class LocalHelper {
  static late Box<dynamic> _userBox; // specify typ
  static String kUserBox = 'user';
  static String kName = 'name';
  static String kImage = 'image';
  static String isUpload = 'isUpload';
  static Box get userBox => _userBox;

  static init() async {
    await Hive.openBox(kUserBox);
    _userBox = Hive.box(kUserBox);
  }

  static cacheData(String key, dynamic value) {
    _userBox.put(key, value);
  }

  static getData(String key) {
    return _userBox.get(key);
  }
}
