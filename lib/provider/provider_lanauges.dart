
import 'package:flutter/material.dart';
class Provider_lanauges extends ChangeNotifier{
  String locale ='en';
  changelanganeEN(){
    locale='en';
    notifyListeners();
  }
  changelanganeAR(){
    locale='ar';
    notifyListeners();
  }


}