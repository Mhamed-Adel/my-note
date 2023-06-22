import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/note_controller.dart';
import '../widgets/alert_dialog.dart';
import 'edit_note.dart';
import 'home_page.dart';

class NoteDetailPage extends StatelessWidget {
  final NoteController controller = Get.find();

  NoteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int? i = ModalRoute.of(context)!.settings.arguments as int?;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('12'.tr),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              Get.to(
                EditNotePage(),
                arguments: i,
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              Get.bottomSheet(
                backgroundColor: Get.isDarkMode
                    ? const Color.fromARGB(137, 107, 106, 106)
                    : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogWidget(
                                contentText:
                                    "13".tr,
                                    
                                confirmFunction: () {
                                  controller
                                      .deleteNote(controller.notes[i!].id!);
                                  Get.offAll(()=>HomePage());
                                },
                                declineFunction: () {
                                  Get.back();
                                },
                              );
                            },
                          );
                        },
                        child:  Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.delete,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "14".tr,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextButton(
                        onPressed: () {
                          controller.shareNote(
                            controller.notes[i!].title!,
                            controller.notes[i].content!,
                          );
                        },
                        child:  Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.share,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "15".tr,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Created :  ${controller.notes[i!].dateTimeCreated!}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '16'.tr+controller.contentWordCount.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                              "17".tr+controller.contentCharCount.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontSize: 18)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: GetBuilder<NoteController>(
        builder: (_) => Scrollbar(
          child: Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SelectableText(controller.notes[i!].title!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "18".tr+controller.notes[i].dateTimeEdited.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SelectableText(
                    controller.notes[i].content!,
                    style: Theme.of(context).textTheme.headlineSmall!
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
