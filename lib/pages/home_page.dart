import 'package:flutter/material.dart';
import 'package:note_app_with_provider/providers/note_provider.dart';
import 'package:note_app_with_provider/utils/my_note_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Notes',
        ),
      ),
      body: Consumer<NoteProvider>(builder: (context, notesProvider, child) {
        notesProvider.loadNotesList();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Builder(builder: (context) {
                return Expanded(
                  child: notesProvider.noteList.isEmpty
                      ? const Center(
                          child: Text(
                            "No notes to show",
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 2 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          shrinkWrap: true,
                          itemCount: notesProvider.noteList.length,
                          itemBuilder: (context, index) {
                            final currentNote = notesProvider.noteList[index];

                            return MyNoteTile(
                              // color: notesProvider.colors[
                              //     notesProvider.colors.length index + 1],
                              color: notesProvider
                                  .colors[index % notesProvider.colors.length],
                              // color: Colors.primaries[
                              //     Random().nextInt(Colors.primaries.length)],
                              noteModel: currentNote,
                              index: index,
                              title: currentNote.title,
                              content: currentNote.content,
                              dateTime: currentNote.creationDate,
                            );
                          }),
                );
              }),
              // Center(child: Text('hello')),
            ],
          ),
        );
      }),
      floatingActionButton: Consumer<NoteProvider>(
        builder: (context1, noteProvider, child) {
          return FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              NoteProvider noteProvider =
                  Provider.of<NoteProvider>(context, listen: false);
              noteProvider.controller.clear();
              noteProvider.secondController.clear();
              noteProvider.inputNew(context);
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
