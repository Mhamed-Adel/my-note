import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/note_controller.dart';
import '../services/locale/lacale_controller.dart';
import '../services/themes_services.dart';
import 'alert_dialog.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
    required this.controller,
    required this.langController,
  });

  final NoteController controller;
  final ChangeLocal langController;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      
      onSelected: (val) {
        if (val == 0) {
          showDialog(
            
            context: context,
            builder: (context) {
              return AlertDialogWidget(
                contentText: "8".tr,
                
                confirmFunction: () {
                  controller.deleteAllNotes();
                  Get.back();
                },
                declineFunction: () {
                  Get.back();
                },
              );
            },
          );
        }
        else if(val == 1){
         Get.defaultDialog(
          
          titleStyle: GoogleFonts.almarai(),
          title: '4'.tr,
          content: Obx(
        () => Column(
    children: [
      SwitchListTile(
        
        title:  Text('6'.tr,style: GoogleFonts.almarai(),),
        activeColor: Colors.teal,
        value: controller.isDarkMode.value, onChanged: (value){
       controller.isDarkMode.value = value;
       ThemeHelper().switchTheme();
      }),
     ListTile(
      title:Text('7'.tr,style: GoogleFonts.almarai()),
      trailing: PopupMenuButton(
        icon:  const Icon(Icons.arrow_drop_down,
        color: Colors.grey,
        ),
        position: PopupMenuPosition.under,
        
        onSelected: (value) {
          if(value == 0){
        langController.changeLocal('ar');
        
          }else if(value == 1){
          langController.changeLocal('en');
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
          value: 0,
          child:Text('عربي',style: GoogleFonts.almarai())
            ),
          const PopupMenuItem(
          value: 1,
          child: Text('English')
        ),
        ],),
     )
    ],
        ),
      ),
         );
        }
      },
      itemBuilder: (context) => [
         PopupMenuItem(
          value: 0,
          child: Text(
            "5".tr,
            style: GoogleFonts.almarai(),
          ),
        ),
         PopupMenuItem(
          value: 1,
          child: Text(
            "4".tr,
            style: GoogleFonts.almarai(),
          ),
        ),
        
      ],
    );
  }
}
