import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/services/services.dart';

class ThemeHelper {

  final light = ThemeData.light(
    useMaterial3: true
  ).copyWith(
    appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 25
    ),
    actionsIconTheme: IconThemeData(
        color: Colors.black,
        
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 90, 223, 210),
      shape: CircleBorder(),
      iconSize: 35
    )
  );

  final dark = ThemeData.dark(
    useMaterial3: false
  ).copyWith(
  appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        
      ),
      
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 90, 223, 210),
      iconSize: 35
    )
  );
  
  MyServices myServices = Get.find();

  _saveThemeMode(bool isDark)=> myServices.sharedPref.setBool('isDark', isDark);
  
  bool _getThemeMode() {
    return myServices.sharedPref.getBool('isDark') ?? false;
  }

  ThemeMode get theme => _getThemeMode() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_getThemeMode() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeMode(!_getThemeMode());
  }
}