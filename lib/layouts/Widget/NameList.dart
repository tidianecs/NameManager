import 'package:flutter/material.dart';
import 'NameItem.dart';

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
                child: NameItem(name: names[index], modifyName: () => _showDialogEdit(context, index), delName: () => _showDeleteConfirm(context, index))
              );
            }
          )
        );
  }



  _showDialogEdit(BuildContext context, int index) {
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
                  modifyName?.call(index, editController.text);
                  Navigator.pop(context);
                }
              },
              child: Text("Confirm")
            )
          ]
        );
      }
    );
  }

  void _showDeleteConfirm(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Delete name"),
        content: Text("Are you sure you want to delete this name?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              delName?.call(index);
              Navigator.pop(context);
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
  }
}