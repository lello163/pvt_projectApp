import 'package:pvt_project/InfoAboutCreatingActivity.dart';
import 'package:pvt_project/CreateEvent.dart';
import 'package:flutter/material.dart';
import 'CreateEvent.dart';
import 'InfoAboutCreatingActivity.dart';

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
    backgroundColor: Colors.grey[200],

    body: Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10.0),
                child: RaisedButton.icon(
                  label: Text("Back"),
                  onPressed: (){ print("Back");},
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: FlatButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoAboutCreatingActivity()),
                    );
                  },
                  icon: Icon(Icons.help),
                  label: Text(""),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50.0),
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
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: Container(
              width: 170,
              child:   RaisedButton(
                color: Colors.blue,
                child: Text("Continue", style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateEvent()),
                  );
                },
              )
            ),
          ),

        ],
      ),
    ), bottomNavigationBar: bottomMenu(context),
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
      items: <String>['Food & Drinks', 'Sport', 'Fitness & Mindfulness', 'Animals', 'Parent Hang', 'Movies', 'Outdoors & Explore', 'Art & Culture']
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
            color: Colors.blue,
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
