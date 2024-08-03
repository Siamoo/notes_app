import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await Hive.initFlutter(); // chouse flutter import
  Bloc.observer = SimpleBlocObserver(); // class to follow the the debug
  Hive.registerAdapter(NoteModelAdapter()); //the adapter from model.g.dart
  await Hive.openBox<NoteModel>(kNotesBox); //kNotesBox is constant key ('notes_box')
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const HomeView(),
      ),
    );
  }
}

