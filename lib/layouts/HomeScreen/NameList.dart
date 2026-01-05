import 'package:flutter/material.dart';

class Namelist extends StatelessWidget {
  final List<String> names;
  final Function(int, String)? modifyName;
  final Function(int)? delName;
  const Namelist({super.key, required this.names, this.modifyName, this.delName});

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
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: Text(names[index], style: TextStyle(color: Colors.blueGrey))),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              final TextEditingController editController = TextEditingController();
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text("Modify name"),
                                    content: TextField(
                                      controller: editController,
                                      decoration: InputDecoration(
                                        labelText: "Name",
                                        border: OutlineInputBorder()
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: (){Navigator.pop(context);},
                                        child: Text("Cancel")
                                      ),
                                      ElevatedButton(
                                        onPressed: (){
                                          if(editController.text.isEmpty){
                                            ScaffoldMessenger.of(context).clearSnackBars();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("Name input is empty"))
                                            );
                                          }
                                          else{
                                            Navigator.pop(context, modifyName?.call(index, editController.text));
                                          }
                                        },
                                        child: Text("Confirm")
                                      )
                                    ]
                                  );
                                }
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.blueGrey)
                          ),
                          IconButton(
                            onPressed: (){delName?.call(index);},
                            icon: Icon(Icons.delete, color: Colors.blueGrey)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          )
        );
  }
}