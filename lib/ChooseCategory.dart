import 'package:pvt_project/InfoAboutCreatingActivity.dart';
import 'package:pvt_project/CreateEvent.dart';
import 'package:flutter/material.dart';
import 'CreateEvent.dart';
import 'InfoAboutCreatingActivity.dart';

class ChooseCategory extends StatefulWidget {
String userID;
String category;
ChooseCategory({Key key, this.userID});

  @override
  State<StatefulWidget> createState(){
    return _ChooseCategoryState(userID: userID);
  }
}



String choice = "";
class _ChooseCategoryState extends State<ChooseCategory> {
  String userID;
  String category;
String woohoo = "Woohoo, let's get started \n   and create your event!";

_ChooseCategoryState({Key key, this.userID});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(""),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.help),
        onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoAboutCreatingActivity()),
                    );
                  },
        )
    ],),
    backgroundColor: Colors.grey[200],

    body: Center(
      child: Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50.0),
            child: Transform.rotate(
                angle: 3/ 20.0,
              child: Text(woohoo, style: TextStyle(fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text('Choose a category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
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
                    MaterialPageRoute(builder: (context) => CreateEvent(userID: userID, category: category)),
                  );
                },
              )
            ),
          ),

        ],
      ),),
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
  String dropdownValue = 'FOODDRINKS';

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
      items: <String>['FOODDRINKS', 'SPORT', 'ANIMALS', 'PARENTHANG', 'FILM', 'EXPLORE', 'FITNESSMINDFULNESS', 'GAMING', 'MUSIC']
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
