import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/note_controller.dart';
import '../view/note_detail.dart';
import 'alert_dialog.dart';

class ViewNotes extends StatelessWidget {
  const ViewNotes({
    super.key,
    required this.controller,
  });

  final NoteController controller;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
        ),
        child:StaggeredGridView.countBuilder(
            itemCount: controller.notes.length,
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 20.0,


            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            itemBuilder: (context, index) {
              return InkWell(
                
                onTap: () {
                  //todo go to other page with index
                  Get.to(()=>
                    NoteDetailPage(),
                    arguments: index,
                  );
                },
                onLongPress: () {

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(
                        contentText: "8".tr,
                        
                        confirmFunction: () {
                          controller.deleteNote(controller.notes[index].id!);
                          Get.back();
                        },
                        declineFunction: () {
                          Get.back();
                        },
                      );
                    },
                  );
                },
                child: Obx(
                  ()=> Container(
                    decoration: BoxDecoration(
                      color: controller.isDarkMode.value ? Colors.black:Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //todo add note(title) from index
                          controller.notes[index].title!,
                          style: GoogleFonts.almarai(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                        const Divider(),
                        
                        Text(
                          //todo add note(content) from index
                          controller.notes[index].content!,
                          style: GoogleFonts.almarai(
                            fontSize: 16
                          ),
                          maxLines: 6,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          //todo add note(date time) from index
                          controller.notes[index].dateTimeEdited!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

    );
  }
}
