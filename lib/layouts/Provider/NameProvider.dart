import 'package:flutter/material.dart';

class Nameprovider extends ChangeNotifier{
  List<String> names = [];
  List<String> favNames = [];

  String getName(int index){
    return names[index];
  }

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

  void addFavName(String name){
    print("${name} is a fav");
    favNames.add(name);
    notifyListeners();
  }
}