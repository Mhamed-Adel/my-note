// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:my_note/services/locale/lacale_controller.dart';
import 'package:my_note/services/services.dart';
import 'package:my_note/services/themes_services.dart';

import '../controller/note_controller.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/search_bar.dart';
import 'add_new_note.dart';
import 'note_detail.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(NoteController());
  final langController = Get.find<ChangeLocal>();
  final MyServices myServices = Get.find();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:  Text(
          "1".tr,
          
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
                
                title: '4'.tr,
                content: Obx(
        () => Column(
          children: [
            SwitchListTile(
              title:  Text('6'.tr),
              activeColor: Colors.teal,
              value: controller.isDarkMode.value, onChanged: (value){
             controller.isDarkMode.value = value;
             ThemeHelper().switchTheme();
            }),
           ListTile(
            title:Text('7'.tr),
            trailing: PopupMenuButton(
              icon:  Icon(Icons.arrow_drop_down,
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
                const PopupMenuItem(
                value: 0,
                child:Text('عربي')
                  ),
                const PopupMenuItem(
                value: 1,
                child: Text('English')
              ),
              ],),
           )
          ],
        ),
      )
               );
              }
            },
            itemBuilder: (context) => [
               PopupMenuItem(
                value: 0,
                child: Text(
                  "5".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               PopupMenuItem(
                value: 1,
                child: Text(
                  "4".tr,
                  style:const TextStyle(
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
        builder: (_) =>controller.isLoading ?const Center(child: CircularProgressIndicator(),):
        controller.isEmpty() ? const EmptyNotes() : ViewNotes(controller: controller)
        
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Get.to(()=>AddNewNotePage());
        },
        child:  Icon(
          Icons.note_alt_outlined,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}





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
}

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
                  style:Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 25,
          
          fontWeight: FontWeight.w500,
                  ),
                ),
                  Text('23'.tr,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
                )
              ],
            ),

          ),
        ],

    );
  }
}
