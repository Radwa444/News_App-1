import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Colors.green;
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: primaryColor,

      shape:  const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))),
      titleTextStyle:TextStyle(fontSize: 24,color: Colors.white,) ,
      elevation: 4,
      centerTitle: true ,
    ),
    textTheme: const TextTheme(headline5: TextStyle(fontSize: 27,color: Colors.white),
        headline6: TextStyle(fontSize:20,color: Colors.black),
        bodyText2: TextStyle(fontSize: 14,color: Colors.white)),
  );
}