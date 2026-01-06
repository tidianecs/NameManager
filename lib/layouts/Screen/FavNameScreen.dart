import 'package:first_training_mobile/layouts/Provider/FavoriteProvider.dart';
import 'package:first_training_mobile/layouts/Provider/NameProvider.dart';
import 'package:first_training_mobile/layouts/Widget/NameList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favnamescreen extends StatefulWidget {
  const Favnamescreen({super.key});

  @override
  State<Favnamescreen> createState() => _FavnamescreenState();
}

class _FavnamescreenState extends State<Favnamescreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueGrey,
      child: Column(
        children: [
          if(context.watch<Nameprovider>().favNames.isEmpty) Container(margin: EdgeInsets.only(top: 20), child: Text("No names yet", style: TextStyle(color: Colors.blueGrey))),
          Namelist(
            names: context.watch<Nameprovider>().favNames,
            modifyName: context.read<Nameprovider>().modifyName,
            delName: context.read<Nameprovider>().delName,
            toggleFav: context.read<Nameprovider>().addFavName
          ),
        ],
      ),
    );
  }
}