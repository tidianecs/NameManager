import 'package:flutter/material.dart';

class Nameprovider extends ChangeNotifier{
  List<String> names = [];

  void addName(String name){
    print(name);
    names.add(name);
    notifyListeners();
  }

  void modifyName(int index, String newName){
    print("${names[index]} becomes ${newName}");
    names[index] = newName;
    notifyListeners();
  }

  void delName(int index){
    print("${names[index]} deleted");
    names.removeAt(index);
    notifyListeners();
  }
}