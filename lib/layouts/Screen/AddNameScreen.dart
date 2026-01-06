import 'package:flutter/material.dart';

final textColor = TextStyle(
    color: Colors.white70
);

class AddNameScreen extends StatelessWidget {
  AddNameScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(color: Colors.white, child: Center(child: Text("Name Manager", style: textColor))),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder()
                  ),
                )
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: (){
                    String name = controller.text;
                    if(name.isEmpty){
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Name Input is empty"))
                      );
                    } 
                    else{
                      Navigator.pop(context, name);
                    }
                  },
                  child: Text("Add", style: TextStyle(color: Colors.blueGrey))
                )
              )
            ],
          ),
        ),
        backgroundColor: Colors.black87,
      );
  }
}