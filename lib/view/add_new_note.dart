import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/note_controller.dart';


class AddNewNotePage extends StatelessWidget {
  final NoteController controller = Get.find();

  AddNewNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "9".tr,
          style: GoogleFonts.almarai()
        ),
       
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              TextField(
                controller: controller.titleController,
                style: GoogleFonts.almarai(
                  fontSize: 27,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1
                ),
                decoration: InputDecoration(
                  hintText: "10".tr,
                  hintStyle: GoogleFonts.almarai(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1
                  ),
                  
                   //TextStyle(
                  //   fontSize: 27,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.grey[600],
                  //   letterSpacing: 1,
                  // ),
                  border: InputBorder.none,

                ),
              ),
               Divider(
                color: Colors.cyan[900],
                thickness: 1,
              ),
              TextField(
                
                style: GoogleFonts.almarai(
                  fontSize: 20
                ),
                controller: controller.contentController,
                decoration:  InputDecoration(
                  hintText: "11".tr,
                  hintStyle:  GoogleFonts.almarai(fontSize: 20),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addNoteToDatabase();
        },
        child:  Icon(
          Icons.check,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}