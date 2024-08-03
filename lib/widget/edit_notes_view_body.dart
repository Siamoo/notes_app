
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widget/app_bar_notes.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({
    super.key, required this.note,
  });
  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {

   String? title, subTitel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
           const SizedBox(
            
              height: 50,
            ),
          AppBarNotes(
            onPressed:() {
              widget.note.titel = title ?? widget.note.titel ;
              widget.note.subTitel= subTitel ?? widget.note.subTitel;
              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },
            titel: 'Edit Note', theicon: const Icon(Icons.check)),
           Column(
      children: [
        Padding(
          padding:const EdgeInsets.symmetric(vertical: 16),
          child: TextField(
            onChanged: (value) {
              title =value;
            },
            decoration: InputDecoration(hintText: widget.note.titel),
          ),
        ),
        Padding(
          padding:const EdgeInsets.symmetric(vertical: 16),
          child: TextField(
            onChanged: (value){
              subTitel =value;
            },
            maxLines: 10,
            decoration: InputDecoration(
              hintText: widget.note.subTitel,
              border:const  OutlineInputBorder(),
            ),
          ),
        ),
      ],
    )
        ],
      ),
    );
  }
}