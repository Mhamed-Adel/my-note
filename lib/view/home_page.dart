import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_note/services/themes_services.dart';

import '../controller/note_controller.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/search_bar.dart';
import 'add_new_note.dart';
import 'note_detail.dart';



class HomePage extends StatelessWidget {
  final controller = Get.put(NoteController());

  HomePage({super.key});

  Widget emptyNotes(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset('assets/making-notes.json',)),
          const SizedBox(height: 50,),
           Expanded(
            flex: 1,
            child: Text(
              
              "You don't have any Notes",
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],

    );
  }

  Widget viewNotes() {
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
              return GestureDetector(
                
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
                        contentText: "Are you sure you want to delete the note?",
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.white:Colors.grey[300],
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
                        style:  const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color:  Colors.black
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      const Divider(),
                      
                      Text(
                        //todo add note(content) from index
                        controller.notes[index].content!,
                        style:  const TextStyle(
                          fontSize: 17,
                          color:   Colors.black,
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
                          color: Colors.black54
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ThemeHelper().switchTheme();
        }, icon:Icon(Get.isDarkMode?Icons.light_mode  :Icons.dark_mode)),
        
        title: const Text(
          "Home",
          
        ),
        centerTitle: true,
        
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchBar());
            },
          ),
          PopupMenuButton(
            onSelected: (val) {
              if (val == 0) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogWidget(
                      contentText: "Are you sure you want to delete all notes?",
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
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 0,
                child: Text(
                  "Delete All Notes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
            ],
          ),
        ], 
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: GetBuilder<NoteController>(
        builder: (_) => controller.isEmpty() ? emptyNotes(context) : viewNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Get.to(()=>AddNewNotePage());
        },
        child: const Icon(
          Icons.note_alt_outlined,
          size: 30,
        ),
      ),
    );
  }
}