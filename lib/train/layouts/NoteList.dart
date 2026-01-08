import 'package:first_training_mobile/train/layouts/NoteItem.dart';
import 'package:flutter/material.dart';

class Notelist extends StatelessWidget {
  final List<String>? notes;
  final Function(int)? delName;
  const Notelist({super.key, this.notes, this.delName});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notes?.length ?? 0,
        itemBuilder: (context, index){
          return Noteitem(name: notes![index], delName: () => delName!(index));
        }
    );
  }
}