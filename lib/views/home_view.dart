import 'package:flutter/material.dart';
import 'package:notes_app/widget/add_note.dart';
import 'package:notes_app/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: ( context) {
              return const AddNote();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const HomeViewBody(),
    );
  }
}
