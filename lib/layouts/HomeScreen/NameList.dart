import 'package:flutter/material.dart';

class Namelist extends StatelessWidget {
  final List<String> names;
  const Namelist({super.key, required this.names});

  @override
  Widget build(BuildContext context) {
        return Flexible(
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
        );
  }
}