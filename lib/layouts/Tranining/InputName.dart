import 'package:flutter/material.dart';

class Inputname extends StatelessWidget {
  final Function(String) addName;
  Inputname({super.key, required this.addName});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder()
            ),
          )
        ),
        Flexible(
          flex: 1,
          child: ElevatedButton(
            onPressed: () => addName(controller.text),
            child: Text("Add Name")
          )
        )
      ],
    );
  }
}