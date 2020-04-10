import 'package:covid_19_mob/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Montserrat',
    appBarTheme: AppBarTheme(
      // color: Colors.blue,
      elevation: 1,
    ),
    primaryColor: Colors.white,
    accentColor: Color(0xffc1048d),
    hintColor: Color(0xffcdd3e0),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[100],
      filled: true,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
    ),
    dividerColor: lightGreyColor,
    buttonColor: Color(0xffc1048d),
    scaffoldBackgroundColor: whiteColor,
    textTheme: TextTheme(
      title: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: blackColor,
      ),
      body1: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        color: greyColor,
      ),
      body2: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Color(0xff696969),
      ),
      button: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.white,
      ),
      display1: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        color: blackColor,
        fontWeight: FontWeight.w600,
      ),
      display2: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Color(0xff696969),
      ),
      display3: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        color: Color(0xff999da7),
      ),
      display4: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
        color: Color(0xff696969),
      ),
    ),
    dividerTheme: DividerThemeData(color: lightGreyColor,thickness: 1),
    canvasColor: Color(0xffe9ebee),
    errorColor: Color(0xfff9f9fb),
  );
}
