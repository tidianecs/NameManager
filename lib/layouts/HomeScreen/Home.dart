import 'package:flutter/material.dart';
import '../AddNameScreen.dart';
import 'NameList.dart';
import 'AddButton.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueGrey,
      child: Column(
        children: [
          if(names.isEmpty) Container(margin: EdgeInsets.only(top: 20), child: Text("No names yet", style: TextStyle(color: Colors.blueGrey))),
          Namelist(names: names),
          AddButton(addName: goToAddName)
        ],
      ),
    );
  }
}