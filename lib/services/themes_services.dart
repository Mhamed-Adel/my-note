import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/services/services.dart';

class ThemeHelper {
  final light = ThemeData.light(useMaterial3: true).copyWith(
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white60),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: CircleBorder(),
        iconSize: 35,
      ),
      scaffoldBackgroundColor: Colors.white70,
      
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan));

  final dark = ThemeData.dark(useMaterial3: true).copyWith(
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          color: Color.fromARGB(255, 57, 57, 57)),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(iconSize: 35),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan));

  MyServices myServices = Get.find();

  saveThemeMode(bool isDark) => myServices.sharedPref.setBool('isDark', isDark);

  bool getThemeMode() {
    return myServices.sharedPref.getBool('isDark') ?? false;
  }

  ThemeMode get theme => getThemeMode() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(getThemeMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!getThemeMode());
  }
}
