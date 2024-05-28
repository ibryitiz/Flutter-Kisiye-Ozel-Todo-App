import 'package:flutter/material.dart';

class MyColors {
  static MyColors? _instance;
  static MyColors get instance {
    _instance ??= MyColors._init();
    return _instance!;
  }

  MyColors._init();

  Color fillColor = Colors.grey.shade100;
  Color white = const Color(0xffffffff);
  Color fabButtonBackgroundColor = const Color(0xffceec50);
  Color black = Colors.black;
  Color backgroundColor = const Color(0xff242426);
  Color textColor = Colors.grey.shade700;
  Color blueTextColor = Colors.blue;
  Color transparentColor = Colors.transparent;
  Color listTileColor = const Color(0xffceec50);
  Color popMenuButtonColor = Colors.blueAccent.shade700;
  Color editColor = Colors.blueAccent;
  Color deleteColor = Colors.red;
}
