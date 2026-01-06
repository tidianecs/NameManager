import 'package:first_training_mobile/layouts/Provider/NameProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AddNameScreen.dart';
import '../Widget/NameList.dart';
import '../Widget/AddButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> goToAddName() async{
    String name = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddNameScreen()
      )
    );

    if(name.isEmpty)return;
    context.read<Nameprovider>().addName(name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueGrey,
      child: Column(
        children: [
          if(context.watch<Nameprovider>().names.isEmpty) Container(margin: EdgeInsets.only(top: 20), child: Text("No names yet", style: TextStyle(color: Colors.blueGrey))),
          Namelist(
            names: context.watch<Nameprovider>().names,
            modifyName: context.read<Nameprovider>().modifyName,
            delName: context.read<Nameprovider>().delName),
          AddButton(addName: goToAddName)
        ],
      ),
    );
  }
}