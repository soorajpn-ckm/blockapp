import 'package:blockapp/dto/Note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final NotesCubit notesCubit = NotesCubit([]);

class NotesCubit extends Cubit<List<Note>> {
  NotesCubit(List<Note> state) : super(state);

  void add() {
    print('## new note list $state  ');
    List<Note> newState = List.from(state);
    newState.add(Note(title: 'titile'));
    emit(newState);
  }

  void remove(int index) {
    List<Note> newState = List.from(state);
    newState.removeAt(index);
    emit(newState);
  }

  void updateState() {
    List<Note> newState = List.from(state);
    emit(newState);
  }

  Note getNote(int index) {
    return state[index];
  }

  void changeTitle() {}
}

List<Note> dumpNotes() {
  List<Note> notes = [];
  for (int i = 0; i < 4; i++) notes.add(dumpData());
  return notes;
}

Note dumpData() {
  Note n = Note(title: " dump titile");
  n.title = 'borrow';
  for (int i = 0; i < 5; i++) {
    Content c = Content();
    c.data = 'data number $i';
    n.contents.add(c);
  }
  return n;
}
