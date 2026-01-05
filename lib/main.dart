import 'package:flutter/material.dart';
import 'layouts/HomeScreen.dart';

void main() {
  runApp(
    MyApp()
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
        body: HomeScreen(),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
