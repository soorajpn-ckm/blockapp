import 'package:blockapp/block/counter_cubit.dart';
import 'package:blockapp/block/notes_block.dart';
import 'package:blockapp/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blockapp/pages/notes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: BlocProvider(
      //   create: (context) => notesCubit,
      //   child: NotesPage(),
      // ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  print('## state is = $state');
                  return Text(
                    '$state',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //context.read<CounterCubit>().add();
          //  buildPopupDialog(context);
          showDialog(
            context: context,
            builder: (BuildContext context) => buildPopupDialog(context),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
