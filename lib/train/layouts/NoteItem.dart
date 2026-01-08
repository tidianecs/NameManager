import 'package:flutter/material.dart';

class Noteitem extends StatelessWidget {
  final String? name;
  final VoidCallback? delName;
  const Noteitem({super.key, this.name, this.delName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(5),
      color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${name}", style: TextStyle(color: Colors.white70)),
          IconButton(
            onPressed: delName,
            icon: Icon(Icons.delete)
          )
        ],
      ),
    );
  }
}