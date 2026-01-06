import 'package:flutter/material.dart';
import 'AddNameScreen.dart';
import '../Widget/NameList.dart';
import '../Widget/AddButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> names = [];

  Future<void> goToAddName() async{
    String name = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddNameScreen()
      )
    );

    setState(() {
      if(name.isEmpty)return;
      print(name);
      names.add(name);
    });
  }

  void modifyName(int index, String newName){
    setState(() {
      print("${names[index]} becomes ${newName}");
      names[index] = newName;
    });
  }

  void delName(int index){
    setState(() {
      print("${names[index]} deleted");
      names.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueGrey,
      child: Column(
        children: [
          if(names.isEmpty) Container(margin: EdgeInsets.only(top: 20), child: Text("No names yet", style: TextStyle(color: Colors.blueGrey))),
          Namelist(names: names, modifyName: modifyName, delName: delName),
          AddButton(addName: goToAddName)
        ],
      ),
    );
  }
}