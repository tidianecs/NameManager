import 'package:flutter/material.dart';

class Counterbutton extends StatelessWidget {
  final VoidCallback increment;
  const Counterbutton({super.key, required this.increment});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => increment(),
      child: Text("INCR")
    );
  }
}