import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/note_controller.dart';


class EditNotePage extends StatelessWidget {
  final NoteController controller = Get.find();

  EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final int? i = ModalRoute.of(context)!.settings.arguments as int?;
    controller.titleController.text = controller.notes[i!].title!;
    controller.contentController.text = controller.notes[i].content!;
    return Scaffold(
      appBar: AppBar(
        
        title:  Text(
          "12".tr,
          style: GoogleFonts.almarai(
                        
                      ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                decoration: InputDecoration(
                  hintText: "10".tr,
                  hintStyle: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    letterSpacing: 1,
                  ),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                style: GoogleFonts.almarai(
                        fontSize: 22,
                        
                      ),
                controller: controller.contentController,
                decoration:  InputDecoration(
                  hintText: "11".tr,
                  hintStyle:const TextStyle(
                    fontSize: 17,
                  ),
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
          controller.updateNote(
              controller.notes[i].id!, controller.notes[i].dateTimeCreated!);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}