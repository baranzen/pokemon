import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static final Map<String, Color> _typeColorMap = {
    'Grass': const Color.fromARGB(204, 121, 77, 223),
    'Fire': const Color.fromARGB(255, 187, 188, 255),
    'Water': const Color.fromARGB(255, 148, 154, 255),
    'Electric': const Color.fromARGB(255, 142, 144, 255),
    'Rock': const Color.fromARGB(255, 137, 139, 255),
    'Ground': const Color.fromARGB(255, 133, 120, 220),
    'Bug': const Color.fromARGB(255, 113, 110, 213),
    'Psychic': const Color.fromARGB(255, 163, 134, 236),
    'Fighting': const Color.fromARGB(255, 130, 122, 225),
    'Ghost': Colors.deepPurple,
    'Normal': const Color.fromARGB(204, 255, 255, 255),
    'Poison': const Color.fromARGB(204, 255, 255, 255),
  };

  static Color getColorFromType(String type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(15.w);
    }
  }

  static EdgeInsets getIconPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(10.h);
    } else {
      return EdgeInsets.all(4.w);
    }
  }

  static double calculatePokeImgAndBallSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.2.sw;
    } else {
      return 0.3.sh;
    }
  }

  static double calculatePokeUIamgeSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.3.sw;
    } else {
      return 0.4.sw;
    }
  }
}
