import 'package:first_training_mobile/train/FirstProvider.dart';
import 'package:first_training_mobile/train/trainLayout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layouts/Screen/Home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MyApp(), 
    )
  );
}

final textColor = TextStyle(
    color: Colors.white70
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.white, child: Center(child: Text("Name Manager", style: textColor))),
          backgroundColor: Colors.blueGrey,
        ),
        body: Trainlayout(),
        //HomeScreen(),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
