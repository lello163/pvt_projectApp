import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:deletethis/ChooseCategory.dart';

class CreateEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _CreateEventState();
  }
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            children: <Widget>[
             textBox(context, 'Name of event'),
              textBox(context, 'Location'),
            ]
        ),
      ),
    );
  }

 Widget textBox(BuildContext context, String hintText){
    return Container(
        height: 30,
        width: 270,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1)
        ),

        child:  TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        )
    );
 }
}


