import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      children: <Widget>[

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomMenu(context),
      body: Column(
        children: <Widget>[
          topMenu(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 50),
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
                          value: everyWeek,
                          activeColor: Colors.red,
                          onChanged: (bool value){onChangedTimes(value, 1);}
                      ),
                      CheckboxListTile(
                          title: Text("Twice"),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: everyOtherWeek,
                          activeColor: Colors.red,
                          onChanged: (bool value){onChangedTimes(value, 2);}
                      ),
                      CheckboxListTile(
                          title: Text("Three times"),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: everyThirdWeek,
                          activeColor: Colors.red,
                          onChanged: (bool value){onChangedTimes(value, 3);}
                      ),
                      CheckboxListTile(
                          title: Text("Four times"),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: onceAMonth,
                          activeColor: Colors.red,
                          onChanged: (bool value){onChangedTimes(value, 4);}

                      ),

                    ]
                ,

        ),
            ),
          ),
        ],
      ),
    );
  }
}

