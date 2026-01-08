import 'package:first_training_mobile/train/layouts/NoteList.dart';
import 'package:first_training_mobile/train/layouts/NotesLoadButton.dart';
import 'package:first_training_mobile/train/model/NoteUiState.dart';
import 'package:first_training_mobile/train/provider/NoteProvider.dart';
import 'package:first_training_mobile/train/repository/NoteRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notescreen extends StatefulWidget {
  const Notescreen({super.key});

  @override
  State<Notescreen> createState() => _NotescreenState();
}

class _NotescreenState extends State<Notescreen> {
  @override
  void initState(){
    super.initState();
    Future.microtask((){
      context.read<Noteprovider>().loadNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Noteprovider provider = context.watch<Noteprovider>();
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
          children: [
            Flexible(
              flex: 2,
              child: _bodyNoteScreen(provider)
            ),
            Flexible(
              flex: 1,
              child: Notesloadbutton(loadNotes: provider.loadNotes)
            )
          ],
        )
    );
  }

  @override
  Widget _bodyNoteScreen(Noteprovider provider){
    switch(provider.state){
      case Noteuistate.empty:
        return Text("No notes yet", style: TextStyle(color: Colors.white70));
      case Noteuistate.error:
        return Text("${provider.errorMessage} !", style: TextStyle(color: Colors.white70));
      case Noteuistate.loading:
        return const Center(child: CircularProgressIndicator());
      case Noteuistate.success:
        return Notelist(notes: provider.notes, delName: provider.delNote);      
      case Noteuistate.idle:
      default:
        return Text("WELCOME TO NOTES MANAGER");
    }
  }
}