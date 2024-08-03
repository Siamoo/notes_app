import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widget/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/widget/list_view_color.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();              //
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titel, subTitel;
  int? color;
  @override
  Widget build(BuildContext context) {
    return Form(                            //
      key: formKey,                         //
      autovalidateMode: autovalidateMode,   //
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
              onSaved: (newValue) {
                titel = newValue;
              },
              validator: (value) {                     
                if (value?.isEmpty ?? true) {           //
                  return 'field is required';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(hintText: 'Titel ...'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextFormField(
              onSaved: (newValue) {
                subTitel = newValue;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {          //
                  return 'field is required';
                } else {
                  return null;
                }
              },
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'type what you need ....',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
            child: ListViewColor(),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>( 
            builder: (context, state) { 
              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {       //
                    formKey.currentState!.save();               //

                    NoteModel noteModel = NoteModel(
                        titel: titel!,
                        subTitel: subTitel!,
                        date: DateFormat('yyyy-MM-dd – kk:mm')
                            .format(DateTime.now()),
                        color: BlocProvider.of<AddNotesCubit>(context).color.value);
                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;  //
                    setState(() {});
                  }
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
