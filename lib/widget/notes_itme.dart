
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({
    super.key,  required this.note,
  });


  final NoteModel note ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(context,MaterialPageRoute(builder: (context) =>  EditNotesView(note: note,)));
      },
      child: Container(
        padding:const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color:  Color(note.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                 note.titel ,
                  style:  TextStyle(color: Colors.white.withOpacity(.9), fontSize: 24,fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                 
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon:  Icon(
                      Icons.delete,
                      color: Colors.white.withOpacity(.9),
                      size: 40,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                     note.subTitel,
                      style: TextStyle(color: Colors.white.withOpacity(.6),fontSize: 17),
                    ),
                  ),
                 const SizedBox(
                    width: 85,
                  )
                ],
              ),
            ),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                   note.date,
                    style: TextStyle(color: Colors.white.withOpacity(.6)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

