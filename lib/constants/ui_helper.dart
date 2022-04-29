import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static final Map<String, Color> _typeColorMap = {
    //! RHBA YAPINCA SAYDAM OLDUĞU İÇİN ARKASI GÖZÜKÜYORDU
    'Grass': Colors.purple,
    'Fire': Colors.redAccent,
    'Water': Colors.purpleAccent,
    'Electric': Colors.teal,
    'Rock': Colors.green,
    'Ground': Colors.purple,
    'Bug': Colors.purple,
    'Psychic': Colors.purple,
    'Fighting': Colors.purple,
    'Ghost': Colors.deepPurple,
    'Normal': Colors.purple,
    'Poison': Colors.purple,
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
