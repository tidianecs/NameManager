import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Future<void> Function() addName;
  const AddButton({super.key, required this.addName});

  @override
  Widget build(BuildContext context) {
    return Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: (){addName();},
              child: Text("+", style: TextStyle(color: Colors.blueGrey))
            )
          );
  }
}