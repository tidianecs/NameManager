import 'package:first_training_mobile/train/model/NoteUiState.dart';
import 'package:first_training_mobile/train/repository/NoteRepository.dart';
import 'package:flutter/material.dart';

class Noteprovider extends ChangeNotifier{
  List<String> notes = [];
  final Noterepository? repository;
  String? errorMessage;
  Noteuistate state = Noteuistate.idle;

  Noteprovider({this.repository});

  void loadNotes() async{
    state = Noteuistate.loading;
    notifyListeners();

    try{
      notes = await repository!.loadNotes();
      state = notes.isEmpty ? Noteuistate.empty : Noteuistate.success;
      notifyListeners();
    } catch(error){
      errorMessage = error.toString();
      print(errorMessage);
      state = Noteuistate.error;
      notifyListeners();
    }
  }

  void delNote(int index){
    repository!.delNote(index);
    state = notes.isEmpty ? Noteuistate.empty : Noteuistate.success;
    notifyListeners();
  }

}