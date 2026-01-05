import 'package:flutter/material.dart';

class AddNameScreen extends StatelessWidget {
  const AddNameScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.white, child: Center(child: Text("Name Manager", style: textColor))),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: TextField(

              )
            )
          ],
        ),
        backgroundColor: Colors.black87,
      );
  }
}