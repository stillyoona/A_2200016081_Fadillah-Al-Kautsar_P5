import 'package:flutter/material.dart';
import 'package:modul_3/models/note_model.dart';

class NoteProvider extends ChangeNotifier {
  List<NoteModel> noteList = [];

  void addNote(NoteModel note) {
    noteList.add(note);
    notifyListeners();
  }

  void deleteNoteById(String id) {
    noteList.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}
