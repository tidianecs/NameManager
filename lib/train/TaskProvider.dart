import 'package:first_training_mobile/train/UiState.dart';
import 'package:flutter/material.dart';

class Taskprovider extends ChangeNotifier{
  List<String> tasks = [];
  Uistate state = Uistate.idle;
  String? errorMessage;

  Future<void> loadTasks() async {
    state = Uistate.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    tasks = [
      "Learn Provider",
      "Build Task Screen",
      "Review UI State"
    ];

    if (tasks.isEmpty) {
      state = Uistate.empty;
    } else {
      state = Uistate.success;
    }

    notifyListeners();
  }


  void addTask(String task){
    if(task.isEmpty){
      errorMessage = "Task can't be empty";
      state = Uistate.error;
      notifyListeners();
      return;
    }
    
    state = Uistate.loading;
    notifyListeners();

    Future.delayed(Duration(seconds: 1), (){
      tasks.add(task);
      state = task.isEmpty ? Uistate.empty : Uistate.success;
      notifyListeners();
    });
  }

  void delTask(int index){
    tasks.removeAt(index);
    state = tasks.isEmpty ? Uistate.empty : Uistate.success;
    notifyListeners();
  }
}