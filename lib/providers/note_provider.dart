import 'package:flutter/material.dart';
import 'package:note_app_with_provider/models/note_model.dart';
import 'package:note_app_with_provider/utils/boxes.dart';
import 'package:note_app_with_provider/utils/delete_dialog.dart';
import 'package:note_app_with_provider/utils/note_show_up.dart';

class NoteProvider extends ChangeNotifier {
  int selectedNote = 0;
  final TextEditingController controller = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  // List notes = [];
  List<NoteModel> noteList = [];

  final List<Color> colors = [
    const Color(0xFFF5C47C),
    const Color(0xFFF5A48B),
    const Color(0xFFDCE599),
    const Color(0xFFC78DD0),
    const Color(0xFF7BD5E1),
    const Color(0xFFD9DFEC),
    const Color(0xFFc0d6e4),
    const Color(0xFFf5f5dc),
    const Color(0xFFffdab9),
    const Color(0xFFafeeee),
    const Color(0xFFf5f5f5),
    const Color(0xFFfaebd7),
    const Color(0xFFeeeeee),
    const Color(0xFFffc3a0),
    const Color(0xFFffe4e1),
    const Color(0xFFC78DD0),
    const Color(0xFF7BD5E1),
    const Color(0xFFD9DFEC),
    const Color(0xFFc0d6e4),
    const Color(0xFFf5f5dc),
    const Color(0xFFffdab9),
    const Color(0xFFafeeee),
    const Color(0xFFF5C47C),
    const Color(0xFFF5A48B),
    const Color(0xFFDCE599),
    const Color(0xFFC78DD0),
    const Color(0xFF7BD5E1),
    const Color(0xFFD9DFEC),
    const Color(0xFFffe4e1),
    const Color(0xFFC78DD0),
    const Color(0xFF7BD5E1),
    const Color(0xFFD9DFEC),
    const Color(0xFFc0d6e4),
    const Color(0xFFf5f5dc),
    const Color(0xFF7BD5E1),
    const Color(0xFFD9DFEC),
    const Color(0xFF999999),
  ];

  // final time = DateTime.now();
  // final timeR =
  // formatDate(time, [M, ", ", d, " ", yyyy, " ", hh, ":", mm, " ", am]);

  // void loadNoteLists() {
  //   print('Load note list');
  //   notes = Boxes.getNotes().values.toList();
  // }

  // addNotes(
  //   BuildContext context,
  // ) {
  //   if (controller.text.isNotEmpty) {
  //     final noteBox = Boxes.getNotes();
  //     noteBox.add([controller.text, secondController.text]);
  //     // noteBox.add(secondController);
  //     controller.clear();
  //     secondController.clear();
  //     notifyListeners();
  //     Navigator.pop(context);
  //     // food.save();
  //     print('${controller.text} added Successfully');
  //   }
  // }

  inputNew(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const NoteShowUp();
        });
    notifyListeners();
  }

  // deleteNote(int index, BuildContext context) {
  //   final noteBox = Boxes.getNotes();
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => DeleteAlertBox(onPressed: () {
  //       Navigator.pop(context);
  //       noteBox.deleteAt(index);
  //       notifyListeners();
  //     }),
  //   );
  // }

  /// Hive CRUD
  void loadNotesList() {
    print("<===== Load notes list =====>");
    noteList = Boxes.getNoteList().values.toList();
  }

  addNewNote(BuildContext context, DateTime? dateTime) {
    if (controller.text.isNotEmpty) {
      NoteModel note = NoteModel(
        title: controller.text,
        content: secondController.text,
        creationDate: dateTime,
      );

      final noteBox = Boxes.getNoteList();
      noteBox.add(note);
      // noteBox.add(secondController);
      controller.clear();
      secondController.clear();
      notifyListeners();
      Navigator.pop(context);
      // food.save();
      print('${controller.text} added Successfully');
    }
  }

  editNoteLists(NoteModel oldNote, BuildContext context) {
    NoteModel newNote = oldNote
      ..title = controller.text
      ..content = secondController.text;

    newNote.save();
    Navigator.pop(context);
    notifyListeners();
  }

  deleteNoteLists(NoteModel note, BuildContext context) {
    // final noteBox = Boxes.getNoteList();
    // note.delete();
    // notifyListeners();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => DeleteAlertBox(onPressed: () {
        Navigator.pop(context);
        note.delete();
        notifyListeners();
      }),
    );
  }

  // time() {
  //   final noteBox = Boxes.getNotes();
  //
  //   noteBox.add(timeR);
  //   notifyListeners();
  // }
}
