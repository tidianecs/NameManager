import 'package:flutter/material.dart';

class Notesloadbutton extends StatelessWidget {
  final VoidCallback? loadNotes;
  const Notesloadbutton({super.key, this.loadNotes});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loadNotes,
      child: Text("Load Notes")
    );
  }
}