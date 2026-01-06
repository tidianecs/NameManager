import 'package:flutter/material.dart';

class NameItem extends StatelessWidget {
  final String name;
  final VoidCallback modifyName;
  final VoidCallback delName;
  final VoidCallback toggleFav;
  const NameItem({super.key, required this.name, required this.modifyName, required this.delName, required this.toggleFav});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: Text(name, style: TextStyle(color: Colors.blueGrey))),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              toggleFav();
                            },
                            icon: Icon(Icons.favorite, color: Colors.blueGrey)
                          ),
                          IconButton(
                            onPressed: (){
                              modifyName();
                            },
                            icon: Icon(Icons.edit, color: Colors.blueGrey)
                          ),
                          IconButton(
                            onPressed: (){delName();},
                            icon: Icon(Icons.delete, color: Colors.blueGrey)
                          )
                        ],
                      )
                    ],
                  ),
                );
  }
}