import 'package:flutter/material.dart';
import 'package:newapp/screen/Home/Home_screen.dart';
import 'package:newapp/shared/style/theme/MyThemeData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home_screen.routeName: (context) => Home_screen(),
      },
      initialRoute: Home_screen.routeName,
      theme: MyThemeData.lightTheme,
    );
  }
}
