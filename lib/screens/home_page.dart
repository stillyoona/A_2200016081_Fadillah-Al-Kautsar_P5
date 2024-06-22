import 'package:flutter/material.dart';
import 'package:modul_3/components/note_card.dart';
import 'package:modul_3/providers/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteState = context.watch<NoteProvider>();
    final noteList = noteState.noteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Note App - Modified by: Abdi Setiawan - 2200016103 - A"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<NoteProvider>(
          builder: (context, value, child) {
            if (noteList.isEmpty) {
              return const Center(child: Text("No Notes Added Yet!"));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  final note = noteList[index];
                  return NoteCard(
                    title: note.title,
                    description: note.description,
                    note: note.note,
                    onDelete: () {
                      noteState.deleteNoteById(note.id);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
