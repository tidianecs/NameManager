import 'package:first_training_mobile/train/TaskList.dart';
import 'package:first_training_mobile/train/TaskProvider.dart';
import 'package:first_training_mobile/train/UiState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Taskscreen extends StatefulWidget {
  const Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<Taskprovider>().loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Taskprovider>();
    return Column(
      children: [
        _buildBody(provider),
        ElevatedButton(
        onPressed: provider.loadTasks,
        child: Text("Load Tasks")
      )
      ],
    );
  }
}

Widget _buildBody(Taskprovider provider){
  switch(provider.state){
    case Uistate.loading:
      return Text("LOADING", style: TextStyle(color: Colors.white));
    
    case Uistate.empty:
      return Text("No name yet", style: TextStyle(color: Colors.white));

    case Uistate.error:
      return Text("${provider.errorMessage} !");

    case Uistate.success:
      return Tasklist(tasks: provider.tasks, delTask: provider.delTask);
    
    case Uistate.idle:
    default:
      return Text("Tidiane is the best", style: TextStyle(color: Colors.white));
  }
}