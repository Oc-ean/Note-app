import 'package:hive/hive.dart';
import 'package:note_app_with_provider/models/note_model.dart';

class Boxes {
  static Box getNotes() => Hive.box('notes');
  static Box<NoteModel> getNoteList() => Hive.box<NoteModel>('noteBox');
}
