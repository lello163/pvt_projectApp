import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pvt_project/InfoAboutCreatingActivity.dart';

import 'ActivitiesAlt.dart';
//SENASTE
class Frequency extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _FrequencyState();
  }
}

class _FrequencyState extends State<Frequency> {
  String frequency ="";
  String times ="";
  bool oneTimeEvent = false;
  bool everyWeek = false;
  bool everyOtherWeek = false;
  bool everyThirdWeek = false;
  bool onceAMonth = false;
  bool once = false;
  bool twice = false;
  bool threeTimes = false;
  bool fourTimes = false;

  void onChangedFrequency(bool value, int i){
    setState(() {
      switch(i){
        case 1:
          oneTimeEvent = value;
          if(value){
            everyWeek = false;
            everyOtherWeek = false;
            everyThirdWeek = false;
            onceAMonth = false;
          }
          break;
        case 2:
          everyWeek = value;
          if(value){
            oneTimeEvent = false;
            everyOtherWeek = false;
            everyThirdWeek = false;
            onceAMonth = false;
          }
          break;
        case 3:
          everyOtherWeek = value;
          if(value){
            oneTimeEvent = false;
            everyWeek = false;
            everyThirdWeek = false;
            onceAMonth = false;
          }

          break;
        case 4:
          everyThirdWeek = value;
          if(value){
            oneTimeEvent = false;
            everyWeek = false;
            everyOtherWeek = false;
            onceAMonth = false;
          }
          break;
        case 5:
          onceAMonth = value;
          if(value){
            oneTimeEvent = false;
            everyWeek = false;
            everyOtherWeek = false;
            everyThirdWeek = false;
          }
          break;
      }



    });
  }

  void onChangedTimes(bool value, int i){
    setState(() {
      switch(i){
        case 1:
          once = value;
          if(value){
            twice = false;
            threeTimes = false;
            fourTimes = false;
          }
          break;
        case 2:
          twice = value;
          if(value){
            once = false;
            threeTimes = false;
            fourTimes = false;
          }
          break;
        case 3:
          threeTimes = value;
          if(value){
            once = false;
            twice = false;
            fourTimes = false;
          }

          break;
        case 4:
          fourTimes = value;
          if(value){
            once = false;
            twice = false;
            threeTimes = false;
          }
          break;
      }



    });
  }

  Widget topMenu(BuildContext context){
    return( Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 10.0),
          child: RaisedButton.icon(
            label: Text("Back"),
            onPressed: (){ print("DatePicker");},
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
    )
    );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomMenu(context),
      body: Column(
        children: <Widget>[
          topMenu(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 50),
              child: ListView(

                children: <Widget>[
                  Text("Frequency", style: TextStyle(fontSize: 24),),
                  CheckboxListTile(
                      title: Text("One time event"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: oneTimeEvent,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedFrequency(value, 1);}
                  ),
                  CheckboxListTile(
                      title: Text("Every week"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: everyWeek,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedFrequency(value, 2);}
                  ),
                  CheckboxListTile(
                      title: Text("Every other week"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: everyOtherWeek,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedFrequency(value, 3);}
                  ),
                  CheckboxListTile(
                      title: Text("Every third week"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: everyThirdWeek,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedFrequency(value, 4);}
                  ),
                  CheckboxListTile(
                      title: Text("Once a month"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: onceAMonth,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedFrequency(value, 5);}

                  ),
                  Text("How many times", style: TextStyle(fontSize: 24),),
                  CheckboxListTile(
                      title: Text("Once"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: once,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedTimes(value, 1);}
                  ),
                  CheckboxListTile(
                      title: Text("Twice"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: twice,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedTimes(value, 2);}
                  ),
                  CheckboxListTile(
                      title: Text("Three times"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: threeTimes,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedTimes(value, 3);}
                  ),
                  CheckboxListTile(
                      title: Text("Four times"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: fourTimes,
                      activeColor: Colors.red,
                      onChanged: (bool value){onChangedTimes(value, 4);}

                  ),

                ]
                ,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:           Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                minWidth: 250,
              child: RaisedButton(
                color: Colors.blue,
                child: Text("Save",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivitiesAlt()),
                  );
                },
              ))),
          )
        ],
      ),
    );
  }
}


