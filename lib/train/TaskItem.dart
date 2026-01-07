import 'package:flutter/material.dart';

class Taskitem extends StatelessWidget {
  final String task;
  final VoidCallback delTask;
  const Taskitem({super.key, required this.task, required this.delTask});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: Text(task, style: TextStyle(color: Colors.blueGrey))),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){delTask();},
                            icon: Icon(Icons.delete, color: Colors.blueGrey)
                          )
                        ],
                      )
                    ],
                  ),
                );
  }
}