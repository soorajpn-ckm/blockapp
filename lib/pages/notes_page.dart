import 'package:blockapp/dto/Note.dart';
import 'package:blockapp/pages/note_view.dart';
import 'package:flutter/material.dart';
import 'package:blockapp/block/notes_block.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _notesCubit = notesCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Notes'),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.sync,
                    color: Colors.yellow,
                  ),
                  onPressed: null),
            ],
          ),
          body: BlocBuilder<NotesCubit, List<Note>>(
            cubit: _notesCubit,
            builder: (context, data) {
              print('### block builder data $data');
              return buildNotesList(context, data);
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _notesCubit.add();
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,

              children: <Widget>[
                DrawerHeader(
                  child: ListTile(
                      title: Text(
                        'MY NOTES',
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(
                        Icons.book,
                        color: Colors.purple,
                        size: 40,
                      )),
                  decoration: BoxDecoration(),
                ),
                ListTile(
                  title: Text(
                    'Log out',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          )),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}

Widget buildNotesList(BuildContext context, var data) {
  if (data.length == 0)
    return Center(
      child: Text('No notes yet'),
    );
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        return Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 5,
            child: ListTile(
              hoverColor: Colors.green,
              title: Text(data[i].title),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  context.read<NotesCubit>().remove(i);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteView(noteId: i),
                  ),
                );
              },
            ),
          ),
        );
      });
}

Widget buildPopupDialog(BuildContext context) {
  print('###haiii');
  return AlertDialog(
    title: const Text('Create new Note'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
