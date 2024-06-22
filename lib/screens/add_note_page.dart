import 'package:flutter/material.dart';
import 'package:modul_3/models/note_model.dart';
import 'package:modul_3/providers/note_provider.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  // TODO 1 : Add TextEditingController for each of the TextFormField
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    // TODO 2 : Dispose all of the TextEditingController
    _titleController.dispose();
    _descriptionController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final noteState = context.watch<NoteProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a Note!"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Let's start adding your new note here!"),
            const SizedBox(height: 24),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    // Adding TextEditingController for each of the TextFormField
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Title cannot be empty!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    // Adding TextEditingController for each of the TextFormField
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    // Adding TextEditingController for each of the TextFormField
                    controller: _noteController,
                    decoration: const InputDecoration(
                      hintText: "Notes",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    textInputAction: TextInputAction.newline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Note cannot be empty!";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Accessing each of the controller's trimmed text.
                  final title = _titleController.text.trim();
                  final note = _noteController.text.trim();
                  final description = _descriptionController.text.trim();

                  final NoteModel addNote = NoteModel(
                    title: title,
                    note: note,
                    description: description.isNotEmpty ? description : null,
                  );

                  noteState.addNote(addNote);
                  Navigator.pop(context);
                }
              },
              child: const Text("Add Note"),
            )
          ],
        ),
      ),
    );
  }
}
