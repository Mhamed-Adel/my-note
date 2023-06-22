import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/services/services.dart';

class ChangeLocal extends GetxController{
MyServices myServices =Get.find();

  void changeLocal (String langCode){
  Locale local = Locale(langCode);
  myServices.sharedPref.setString('lang', langCode);
  Get.updateLocale(local);
  
  }

}