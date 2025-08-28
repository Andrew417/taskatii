import 'package:flutter/widgets.dart';

class TextStyles {
  static TextStyle getTitle({
    Color? color,
    FontWeight? fontweight,
    double? fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: fontweight ?? FontWeight.bold,
      color: color,
    );
  }

  static TextStyle getBody({
    Color? color,
    FontWeight? fontweight,
    double? fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontweight ?? FontWeight.normal,
      color: color,
    );
  }

  static TextStyle getSmall({
    Color? color,
    FontWeight? fontweight,
    double? fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: fontweight ?? FontWeight.normal,
      color: color,
    );
  }
}
