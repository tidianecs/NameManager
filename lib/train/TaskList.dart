import 'package:first_training_mobile/layouts/Screen/FavNameScreen.dart';
import 'package:first_training_mobile/train/TaskItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Tasklist extends StatelessWidget {
  final List<String> tasks;
  final Function(int)? delTask;
  const Tasklist({super.key, required this.tasks, required this.delTask});

  @override
  Widget build(BuildContext context) {
        return Flexible(
          flex: 3,
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index){
              return Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                child: Taskitem(task: tasks[index], delTask: () => _showDeleteConfirm(context, index))
              );
            }
          )
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
              delTask?.call(index);
              Navigator.pop(context);
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
  }
}