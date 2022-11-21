import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:note_app_with_provider/providers/note_provider.dart';
import 'package:provider/provider.dart';

class NoteShowUp extends StatelessWidget {
  final dynamic noteModel;
  const NoteShowUp({Key? key, this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();
    return SafeArea(
      child: Consumer<NoteProvider>(
        builder: (context, noteProvider, _) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade300),
                        child: const Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (noteModel != null) {
                          noteProvider.editNoteLists(noteModel, context);
                        } else {
                          noteProvider.addNewNote(
                            context,
                            DateTime.now(),
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey,
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      TextField(
                        style:
                            const TextStyle(fontSize: 25, fontFamily: 'Roboto'),
                        keyboardType: TextInputType.visiblePassword,
                        controller: noteProvider.controller,
                        maxLines: 2,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: 'Enter titles',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.black54.withOpacity(0.2),
                              fontSize: 17),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        formatDate(
                          time,
                          [
                            M,
                            ", ",
                            d,
                            " ",
                            yyyy,
                            " ",
                            "at",
                            " ",
                            hh,
                            ":",
                            nn,
                            " ",
                            am
                          ],
                        ),
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                            fontFamily: 'Roboto', color: Colors.black45),
                        // keyboardType: TextInputType.visiblePassword,
                        minLines: 5,
                        maxLines: 350,
                        controller: noteProvider.secondController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 18),
                          hintText: 'Enter content',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black54.withOpacity(0.2),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Container(
                      //       width: double.infinity,
                      //       height: 55,
                      //       child: RawMaterialButton(
                      //         onPressed: () {
                      //           print(DateTime.now());
                      //           if (noteModel != null) {
                      //             noteProvider.editNoteLists(
                      //                 noteModel, context);
                      //           } else {
                      //             noteProvider.addNewNote(
                      //               context,
                      //               DateTime.now(),
                      //             );
                      //           }
                      //         },
                      //         fillColor: Colors.blueGrey.shade500,
                      //         child: const Text(
                      //           // widget.note == null ? "Add Note" : "Edit Note",
                      //           'Add note',
                      //           style: TextStyle(
                      //             fontSize: 18,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // )
                      // Expanded(
                      //   child: Align(
                      //     alignment: FractionalOffset.bottomCenter,
                      //     child: Container(
                      //       width: double.infinity,
                      //       height: 55,
                      //       child: RawMaterialButton(
                      //         onPressed: () {
                      //           print(DateTime.now());
                      //           if (noteModel != null) {
                      //             noteProvider.editNoteLists(noteModel, context);
                      //           } else {
                      //             noteProvider.addNewNote(
                      //               context,
                      //               DateTime.now(),
                      //             );
                      //           }
                      //         },
                      //         fillColor: Colors.blueGrey.shade500,
                      //         child: const Text(
                      //           // widget.note == null ? "Add Note" : "Edit Note",
                      //           'Add note',
                      //           style: TextStyle(
                      //             fontSize: 18,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
