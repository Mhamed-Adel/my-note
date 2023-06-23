// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_note/services/locale/lacale_controller.dart';
import 'package:my_note/services/services.dart';
import '../controller/note_controller.dart';
import '../widgets/empty_note_widget.dart';
import '../widgets/search_bar.dart';
import '../widgets/settings_widget.dart';
import '../widgets/view_notes_widget.dart';
import 'add_new_note.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(NoteController());
  final langController = Get.find<ChangeLocal>();
  final MyServices myServices = Get.find();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "1".tr,
          style: GoogleFonts.almarai(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchBar());
            },
          ),
          SettingsWidget(
              controller: controller, langController: langController),
        ],
      ),
      body: GetBuilder<NoteController>(
          builder: (_) => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.isEmpty()
                  ? const EmptyNotes()
                  : ViewNotes(controller: controller)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNewNotePage());
        },
        child: Icon(
          Icons.note_alt_outlined,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
