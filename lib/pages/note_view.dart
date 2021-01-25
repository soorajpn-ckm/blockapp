import 'package:blockapp/dto/Note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blockapp/block/notes_block.dart';

class NoteView extends StatefulWidget {
  final int noteId;
  NoteView({this.noteId});

  @override
  _NoteViewState createState() => _NoteViewState(noteId: noteId);
}

class _NoteViewState extends State<NoteView> {
  int noteId;
  Note note;
  var data = dumpData();

  bool x = false;
  _NoteViewState({this.noteId}) {
    note = notesCubit.getNote(noteId);
  }

  @override
  void dispose() {
    notesCubit.updateState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('WW build method working');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.sync,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: SafeArea(
        //  / buildSmalNoteCards()

        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Card(
            child: buildNoteViewCard(context),
          ),
        ),
      ),
    );
  }

  ListView buildNoteViewCard(BuildContext context) {
    return ListView.builder(
      itemCount: note.contents.length,
      itemBuilder: (context, i) {
        if (i == 0) {
          i--;
          return ListTile(
            tileColor: Colors.black26,
            title: TextField(
              minLines: 3,
              maxLines: 3,
              controller: TextEditingController(text: note.title),
              textAlignVertical: TextAlignVertical.center,
              onChanged: (inputVal) {
                note.title = inputVal;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
            trailing: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                color: Colors.black,
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    note.contents.add(Content());
                  });
                },
              ),
            ),
          );
        } else {
          return Card(
            child: ListTile(
              tileColor:
                  note.contents[i].checked ? Colors.blueGrey : Colors.white,
              title: TextField(
                minLines: 2,
                maxLines: 7,
                controller: TextEditingController(text: note.contents[i].data),
                textAlignVertical: TextAlignVertical.center,
                onChanged: (inputVal) {
                  note.contents[i].data = inputVal;
                },

                decoration: InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'write Something',
                ),

                //   data.contents[i].data
              ),
              trailing: Checkbox(
                value: note.contents[i].checked,
                onChanged: (value) {
                  setState(() {
                    note.contents[i].checked = value;
                  });
                },
              ),
            ),
          );
        }
      },
    );
  }
}

class NoteContentInput extends StatelessWidget {
  final String data;
  NoteContentInput({@required this.data});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: "Hint here"),
    );
  }
}

Widget buildSmalNoteCards() {
  return ListView(
    children: [
      Card(
        elevation: 5,
        child: Text('abi 150'),
      )
    ],
  );
}

Note dumpData() {
  Note n = Note();
  n.title = 'borrow';
  for (int i = 0; i < 5; i++) {
    Content c = Content();
    c.data = 'data number $i';
    n.contents.add(c);
  }
  return n;
}
