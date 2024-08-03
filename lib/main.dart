import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/views/home_view.dart';


void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: HomeView(),
      ),
    );
  }
}

