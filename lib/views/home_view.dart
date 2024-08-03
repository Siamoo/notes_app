import 'package:flutter/material.dart';
import 'package:notes_app/widget/notes_app_bar.dart';
import 'package:notes_app/widget/notes_itme.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          AppBarNotes(),
         
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: NotesItem(),
                  );
                }),
              ))
        ],
      ),
    );
  }
}
