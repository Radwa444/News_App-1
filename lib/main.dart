import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newapp/provider/provider_lanauges.dart';
import 'package:newapp/screen/Home/Home_screen.dart';
import 'package:newapp/shared/style/theme/MyThemeData.dart';
import 'package:newapp/shared/style/component/News_Title.dart';
import 'package:newapp/shared/style/component/web_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => Provider_lanauges(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var proveter=Provider.of<Provider_lanauges>(context,);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        Home_screen.routeName: (context) => Home_screen(),
        News_Title.routeName:(_)=>News_Title(),
        Web_view.routeName:(_)=>Web_view(),
      },
      initialRoute: Home_screen.routeName,
      theme: MyThemeData.lightTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(proveter.locale),
    );
  }
}
