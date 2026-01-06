import 'package:first_training_mobile/train/FirstProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Trainlayout extends StatelessWidget {
  const Trainlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text("${context.watch<Counter>().count}", style: TextStyle(color: Colors.white)),
          ElevatedButton(
            onPressed: () => context.read<Counter>().increment(),
            child: Text("Up")
          ),
          ElevatedButton(
            onPressed: () => context.read<Counter>().decrement(),
            child: Text("Down")
          )
        ],
      ),
    );
  }
}