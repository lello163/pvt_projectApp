import 'package:flutter/material.dart';

class ChooseCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _ChooseCategoryState();
  }
}



String choice = "";
class _ChooseCategoryState extends State<ChooseCategory> {
String woohoo = "Woohoo, let's get started \n   and create your event!";

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Transform.rotate(
                  angle: 3/ 20.0,
                child: Text(woohoo, style: TextStyle(fontSize: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text('Choose a category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            DropdownMenu(),
          ],
        ),
      ),
    )
  );
}
}


class DropdownMenu extends StatefulWidget {
  DropdownMenu({Key key}) : super(key: key);

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String dropdownValue = 'Food & Drinks';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          choice = newValue;
        });
      },
      items: <String>['Food & Drinks', 'Sport', 'Fitness & Mindfullness', 'Animals', 'Parent Hang', 'Movies', 'Outdoors & Explore', 'Art & Culture']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),

        );
      }).toList(),
    );
  }
}

Widget bottomMenu(BuildContext context){
  return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            color: Colors.black,
            iconSize: 40,
            onPressed: (){
              print("PROFILE PAGE");
            },
          ),
          IconButton(
            icon: Icon(Icons.message),
            color: Colors.black,
            iconSize: 40,
            onPressed: (){
              print("MESSAGE PAGE");
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            color: Colors.black,
            iconSize: 40,
            onPressed: (){
              print("pressed");
            },
          ),
          IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.black,
            iconSize: 40,
            onPressed: (){
              print("MAP PAGE");
            },
          ),
        ],
      )
  );
}
