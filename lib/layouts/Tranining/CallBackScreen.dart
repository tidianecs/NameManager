import 'package:flutter/material.dart';
import 'CounterButton.dart';

class Callbackscreen extends StatefulWidget {
  const Callbackscreen({super.key});

  @override
  State<Callbackscreen> createState() => _CallbackscreenState();
}

class _CallbackscreenState extends State<Callbackscreen> {
  int count = 0;

  void increment(){
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Center(child: Text("${count}", style: TextStyle(color: Colors.white))),
          Counterbutton(increment: increment)
        ],
      ),
    );
  }
}