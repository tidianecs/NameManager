import 'package:flutter/material.dart';
import 'AddNameScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> names = [];

  Future<void> goToAddName() async{
    final name = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddNameScreen()
      )
    );

    setState(() {
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
          Flexible(
            flex: 3,
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index){
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(20),
                  child: Center(child: Text(names[index], style: TextStyle(color: Colors.blueGrey))),
                );
              }
            )
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: goToAddName,
              child: Text("+", style: TextStyle(color: Colors.blueGrey))
            )
          )
        ],
      ),
    );
  }
}