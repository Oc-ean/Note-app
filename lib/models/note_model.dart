import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;
  @HiveField(2)
  DateTime? creationDate;

  NoteModel({
    this.title,
    this.content,
    this.creationDate,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      content: json['content'],
      creationDate: json['creationDate'],
    );
  }
  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'creationDate': creationDate,
      };
}
