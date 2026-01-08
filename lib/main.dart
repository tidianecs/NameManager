import 'package:first_training_mobile/layouts/Provider/FavoriteProvider.dart';
import 'package:first_training_mobile/layouts/Provider/NameProvider.dart';
import 'package:first_training_mobile/train/layouts/NoteScreen.dart';
import 'package:first_training_mobile/train/provider/NoteProvider.dart';
import 'package:first_training_mobile/train/repository/NoteRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layouts/Screen/Home.dart';
import 'package:first_training_mobile/train/repository/FakeApiRepository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => Fakeapirepository()),
        Provider(
          create: (context) => Noterepository(
            apiRepository: context.read<Fakeapirepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Noteprovider(
            repository: context.read<Noterepository>(),
          ),
        /*Nameprovider()*/),
      ],
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
          title: Title(color: Colors.white, child: Center(child: Text("Notes Manager", style: textColor))),
          backgroundColor: Colors.blueGrey,
        ),
        body: Notescreen(),
        //HomeScreen(),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
