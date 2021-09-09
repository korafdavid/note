import 'dart:math';

import 'package:flutter/material.dart';

final rand = Random();
Color primaryColor = const Color.fromARGB(255, 190, 25, 55);
Color reallyLightGrey = Colors.grey.withAlpha(25);
ThemeData appThemeLight =
    ThemeData.light().copyWith(primaryColor: primaryColor);
ThemeData appThemeDark = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    toggleableActiveColor: primaryColor,
  //  accentColor: primaryColor,
   // buttonColor: primaryColor,
    textSelectionTheme: TextSelectionThemeData(
     selectionColor: primaryColor,
    selectionHandleColor: primaryColor));
