import 'package:flutter/cupertino.dart';

class Note {
  String id;
  Note({@required this.title});
  String title;
  List<Content> contents = [Content()];
}

class Content {
  String data = '';
  bool checked = false;
}

class NotesEvents {}

class UpdateNoteEvent {
  Note note;
  UpdateNoteEvent({@required this.note});
}
