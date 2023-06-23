import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertDialogWidget extends StatelessWidget {
  final String? contentText;
  final void Function()? confirmFunction;
  final void Function()? declineFunction;

  const AlertDialogWidget({super.key, 
    this.contentText,
    this.confirmFunction,
    this.declineFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //backgroundColor: Get.isDarkMode ? Color.fromARGB(255, 161, 32, 32):const Color.fromARGB(255, 88, 62, 62),
      content: Text(
        contentText!,
        style: GoogleFonts.almarai(
                        fontSize: 20,
                        
                      ),
      ),
      actions: [
        TextButton(
          onPressed: declineFunction,
          child:  Text("21".tr,
          style: GoogleFonts.almarai(
            fontSize: 16
          ),),
        ),
        TextButton(
          onPressed: confirmFunction,
          child:  Text("20".tr,
          style: GoogleFonts.almarai(
            fontSize: 16
          ),
          ),
        ),
      ],
    );
  }
}