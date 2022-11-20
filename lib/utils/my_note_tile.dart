import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:note_app_with_provider/models/note_model.dart';
import 'package:note_app_with_provider/providers/note_provider.dart';
import 'package:note_app_with_provider/utils/note_show_up.dart';

import 'package:provider/provider.dart';

class MyNoteTile extends StatefulWidget {
  final NoteModel? noteModel;
  final dynamic title;
  final dynamic index;
  final dynamic content;
  // final dynamic colorIndex;
  final dynamic color;
  final DateTime? dateTime;

  const MyNoteTile({
    Key? key,
    this.noteModel,
    this.color,
    required this.title,
    this.content,
    required this.index,
    this.dateTime,
  }) : super(key: key);

  @override
  State<MyNoteTile> createState() => _MyNoteTileState();
}

class _MyNoteTileState extends State<MyNoteTile> {
  @override
  Widget build(
    BuildContext context,
  ) {
    // GlobalKey<ScaffoldState> _key = GlobalKey();
    // final time = DateTime.now();

    return Consumer<NoteProvider>(builder: (context1, noteProvider, child) {
      return Container(
        margin: const EdgeInsets.only(bottom: 7),
        // height: 130,
        // width: 170,
        padding: const EdgeInsets.only(
          left: 13,
          top: 19,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: widget.color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Colors.black54,
              ),
            ),
            // Text(
            //   dateTime.toString(),
            // ),
            const SizedBox(
              height: 5,
            ),
            Text(
              formatDate(
                widget.dateTime!,
                [
                  M,
                  ", ",
                  d,
                  " ",
                  yyyy,
                  " ",
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    NoteProvider noteProvider =
                        Provider.of<NoteProvider>(context, listen: false);
                    noteProvider.controller.text = widget.noteModel!.title!;
                    noteProvider.secondController.text =
                        widget.noteModel!.content!;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteShowUp(
                          noteModel: widget.noteModel,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 37,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.brown.shade100),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    noteProvider.deleteNoteLists(widget.noteModel!, context);
                  },
                  child: Container(
                    height: 37,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink.shade100),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),

        // InkWell(
        //   onTap: () {
        //     noteProvider.deleteNoteLists(noteModel!, context);
        //   },
        //   child: Container(
        //     margin: const EdgeInsets.only(bottom: 10),
        //     height: 65,
        //     width: 45,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       color: Colors.red,
        //     ),
        //     child: const Icon(
        //       Icons.delete,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        // const SizedBox(width: 9),
        // InkWell(
        //   onTap: () {
        //     NoteProvider noteProvider =
        //         Provider.of<NoteProvider>(context, listen: false);
        //     noteProvider.controller.text = noteModel!.title!;
        //     noteProvider.secondController.text = noteModel!.content!;
        //
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => NoteShowUp(
        //                 noteModel: noteModel,
        //               )),
        //     );
        //   },
        //   child: Container(
        //     margin: const EdgeInsets.only(bottom: 10),
        //     height: 65,
        //     width: 45,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       color: Colors.green,
        //     ),
        //     child: const Icon(
        //       Icons.edit,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      );
    });
  }
}
