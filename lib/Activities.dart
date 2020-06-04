import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:http/http.dart';
import 'package:pvt_project/ChooseCategory.dart';
import 'package:pvt_project/Frequency.dart';
import 'package:pvt_project/screens/message_screen.dart';
import 'EventInfo.dart';
import 'profilepageview.dart';
import 'CreateEvent.dart';
import 'package:pvt_project/widgets/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class ActivityList {
  final List<Activity> activities;

  ActivityList({
    this.activities,
  });

  factory ActivityList.fromJson(List<dynamic> parsedJson) {

    List<Activity> activities = new List<Activity>();
    activities = parsedJson.map((i)=>Activity.fromJson(i)).toList();

    return new ActivityList(
        activities: activities
    );
  }
}

class Activity {
  final String actName;
  final String actDate;

  Activity(
      {this.actName,
        this.actDate,
      });

  factory Activity.fromJson(Map<String, dynamic> parsedJson){
    return Activity(
      actName: parsedJson['name'],
      actDate: parsedJson['time'],
    );
  }

  String getActName(){
    return actName;
  }

  String getActDate(){
    return actDate;
  }


}

Future<void> getAllActivitiesFromServer() async {
  String url = "https://group5-15.pvt.dsv.su.se/activity/getall";
  Response response = await get(url);
  var dataJson = json.decode(response.body);
  print(dataJson);
  ActivityList activities = new ActivityList.fromJson(dataJson);
  print("HEY" + activities.activities[0].getActName());
}

class AllActivities {
  final List<Activity> allActivities;


  AllActivities({this.allActivities});

  factory AllActivities.fromJson(Map<String, dynamic> parsedJson){

    return AllActivities(
      allActivities: parsedJson['name'],
      unit: parsedJson['unit'],
      values: parsedJson['values'],
    );
  }

}

class Parameters {
  final String name;
  final String unit;
  final List values;

  Parameters({this.name, this.unit, this.values});

  factory Parameters.fromJson(Map<String, dynamic> parsedJson){

    return Parameters(
      name: parsedJson['name'],
      unit: parsedJson['unit'],
      values: parsedJson['values'],
    );
  }
}


class Activities extends StatefulWidget {
  String userID;
  Activities({Key key, this.userID});

  @override
  _Activities createState() => _Activities(userID: userID);
}

class _Activities extends State<Activities> {
  bool showAll = true;
  String userID;
  String apiKey = 'AIzaSyCIYW5-ghM8mTSFRgJynHXXnz-bfKhgi_k';

  _Activities({Key key, this.userID});

  Future<void> _showMeetAgainMessage() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Isn\'t it fun to meet new people?'),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Did you have a fun time at the Coffe Hangout activity? \nDo you wish to meet them again?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("No"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed:() {
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      },
    );  
  }

  @override
  Widget build(BuildContext context) {

 /*   var newActivity = new Card(
      child: ListTile(
        onTap: (){
          Navigator.push(context, 
              MaterialPageRoute(builder: (context) => CreateEvent()));
        },
        leading:
         ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 190,
            minHeight: 64,
            maxWidth: 190,
            maxHeight: 64,
          ),
          child: Image.asset('assets/fooddrinks.png', fit: BoxFit.cover),
),
        title: Text(actName),
        subtitle: Text(actDate + "\nParticipants" + actParticipants),
        isThreeLine: true,
      ),
    );
*/
    var dog = new Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 190,
            minHeight: 64,
            maxWidth: 190,
            maxHeight: 64,
          ),
          child: Image.asset('assets/animals2.png', fit: BoxFit.cover),
        ),
        title: Text('A dog walk'),
        subtitle: Text('Sundays 10:00. \nParticipants 3/4'),
        isThreeLine: true,
      ),
    );

    var fika = new Card(
      child: ListTile(
        onTap: (){
          Navigator.push(context, 
              MaterialPageRoute(builder: (context) => CreateEvent()));
        },
        leading:
         ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 190,
            minHeight: 64,
            maxWidth: 190,
            maxHeight: 64,
          ),
          child: Image.asset('assets/fooddrinks.png', fit: BoxFit.cover),
),
        title: Text('Fika Group'),
        subtitle: Text('Sunday 15:00. \nParticipants 3/6'),
        isThreeLine: true,
      ),
    );

    var volley = new Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 190,
            minHeight: 64,
            maxWidth: 190,
            maxHeight: 64,
          ),
          child: Image.asset('assets/sports2.png', fit: BoxFit.cover),
        ),
        title: Text('Play Volleyball'),
        subtitle: Text('Thursdays 17:00. \nParticipants 10/12'),
        isThreeLine: true,
      ),
    );

  void _changeAllAct(){
    setState(() {
      showAll = !showAll;
    });
  }
  
  
  List<Card> allAct = <Card>[
    fika,
    dog,
    volley,

  ];

  List<Card> signedAct = <Card>[
  
  ];

  List<Card> actList;
  if (showAll){
    actList = allAct;
  }
  else{
    actList = signedAct;
  }
  
  var allActButton = new RaisedButton(
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(5.0),
    ),
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
    onPressed: showAll ? null : () => _changeAllAct(),
    color: Colors.blue[700],
    child: Text(
      "All Activities",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Monserrat',
        letterSpacing: 2),
    ),
  );

  var signedUpButton = new RaisedButton(
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(5.0),
    ),
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
    onPressed: !showAll ? null : () => _changeAllAct(),
    color: Colors.blue[700],
    child: Text(
      "Activities I've signed up for",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Monserrat',
        letterSpacing: 2),
    ),
  );



    return Scaffold(
      appBar: AppBar(
        title: showAll? Text('All Activities') : Text("Activities I've signed up for"),
        actions: <Widget>[
          IconButton( 
            color: Colors.blue[900],
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Add route to schedule new event.
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => ChooseCategory(userID: userID))
              );
            },
          )
        ],
      ),

      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: allActButton,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: signedUpButton,
            )

          ],),
        Expanded(
        child: ListView.builder(
          itemCount: actList.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: actList[index],
            );

          }
        )
          )

      ],),
      
      
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person,
                ),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                iconSize: 30,
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessageScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                color: Colors.blue[700],
                iconSize: 30,
                onPressed: (){
                  _showMeetAgainMessage();
                },
              ),
              IconButton(
                icon: Icon(Icons.location_on),
                iconSize:30,
                 onPressed: () async {
                    LocationResult result = await showLocationPicker(
                      context,
                      apiKey,
                      initialCenter: LatLng(31.1975844, 29.9598339),
//                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                      myLocationButtonEnabled: true,
                      layersButtonEnabled: true,
//                      resultCardAlignment: Alignment.bottomCenter,
                    );
                    print("result = $result");
                  },
                
              )
            ],
          )),


    );

  }

}