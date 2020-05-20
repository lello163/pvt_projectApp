import 'package:pvt_project/ChooseCategory.dart';
import 'package:flutter/material.dart';

class InfoAboutCreatingActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _InfoAboutCreatingActivityState();
  }
}




class _InfoAboutCreatingActivityState extends State<InfoAboutCreatingActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10.0),
                child: RaisedButton.icon(
                  label: Text("Back"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChooseCategory()),
                      );
                    },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: Text("Information about creating an activity", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 37.0),
            child: Text("[PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER] [PLACEHOLDER]"),
          ),
        ],

      ),
      bottomNavigationBar: bottomMenu(context),
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