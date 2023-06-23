import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EmptyNotes extends StatelessWidget {
  

  const EmptyNotes({
    Key? key,
    
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset('assets/making-notes.json',)),
           Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  
                  "22".tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                  Text('23'.tr,
                style: GoogleFonts.almarai(
                  fontSize: 16,
                ),
                )
              ],
            ),

          ),
        ],

    );
  }
}
