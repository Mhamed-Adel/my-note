import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/services/themes_services.dart';
import 'package:my_note/view/home_page.dart';
import 'package:my_note/services/services.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'My Note',
      theme: ThemeHelper().light,
      darkTheme: ThemeHelper().dark,
      themeMode: ThemeHelper().theme,
      
      home:  HomePage(),
    );
  }
}

