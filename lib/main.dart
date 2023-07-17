import 'package:flutter/material.dart';
import 'package:newapp/screen/Home/Home_screen.dart';
import 'package:newapp/shared/style/theme/MyThemeData.dart';
import 'package:newapp/shared/style/component/News_Title.dart';
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
        News_Title.routeName:(_)=>News_Title(),
      },
      initialRoute: Home_screen.routeName,
      theme: MyThemeData.lightTheme,
    );
  }
}
