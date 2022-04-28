import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('app title');
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constatns.title,
                style: Constatns.getTitleStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              Constatns.pokeBallImagePath,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
