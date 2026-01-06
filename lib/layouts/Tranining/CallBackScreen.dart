import 'package:flutter/material.dart';
import 'InputName.dart';

class Callbackscreen extends StatefulWidget {
  const Callbackscreen({super.key});

  @override
  State<Callbackscreen> createState() => _CallbackscreenState();
}

class _CallbackscreenState extends State<Callbackscreen> {
  List<String> names = [];

  void addName(String name){
    setState(() {
      names.add(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index){
                return Text(names[index]);
              }
            )
          ),
          Flexible(
            flex: 1,
            child: Inputname(addName: addName)
          )
        ],
      ),
    );
  }
}