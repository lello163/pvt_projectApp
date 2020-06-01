import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:google_map_location_picker/google_map_location_picker.dart';
=======
import 'package:pvt_project/Frequency.dart';
>>>>>>> d9b300af17ead3a132a9c5f1c827af838c8c16fa
import 'package:pvt_project/SignedUpActivities.dart';
import 'package:pvt_project/screens/message_screen.dart';
import 'EventInfo.dart';
import 'profilepageview.dart';
import 'CreateEvent.dart';
import 'package:pvt_project/widgets/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AllActivities extends StatefulWidget {
  @override
  _AllActivities createState() => _AllActivities();
}

class _AllActivities extends State<AllActivities> {
<<<<<<< HEAD
  String apiKey = 'AIzaSyCIYW5-ghM8mTSFRgJynHXXnz-bfKhgi_k';
=======
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





>>>>>>> d9b300af17ead3a132a9c5f1c827af838c8c16fa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Activities"),
        actions: <Widget>[
          IconButton( 
            color: Colors.blue[900],
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Add route to schedule new event.
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => CreateEvent())
              );
            },
          )
        ],
      ),

      body: GridView.count(
        padding: const EdgeInsets.all(10),
        childAspectRatio: (5/1),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        children: <Widget>[
          Row(children: <Widget>[
            Center(
              child: RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              onPressed: null,
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

            ),
            ),
            Center(
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(2.0),
              ),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignedUpActivities()));
              },
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

            )
            )
          ],),

          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventInfo()));

            },
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: const Text(
                    'Fika Group',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  ),
                ),
                Center(
                  child: Text(
                    'Sunday. 15:00',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  )
                ),
                Center(
                  child: Text(
                    'Participants: 3/6',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  )
                ),
                ],
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/fooddrinks.png'),
                      fit: BoxFit.fitWidth)),
          ),
          ),
           Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: const Text(
                    'A dog walk',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  ),
                ),
                Center(
                  child: Text(
                    'Sundays. 10:00',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  )
                ),
                Center(
                  child: Text(
                    'Participants: 3/4',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  )
                ),
                ],
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/animals2.png'),
                      fit: BoxFit.fitWidth)),
          ),
           Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: const Text(
                    'Play Volleyball',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  ),
                ),
                Center(
                  child: Text(
                    'Thursdays. 17:00',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  )
                ),
                Center(
                  child: Text(
                    'Participants: 10/12',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  )
                ),
                ],
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/sports2.png'),
                      fit: BoxFit.fitWidth)),
          ),

          /*
              Container(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: const Text(
                    'Fika group',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/fooddrinks.png'),
                      fit: BoxFit.fitWidth)),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: const Text(
                    'A dog walk',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/animals2.png'),
                      fit: BoxFit.fitWidth)),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: const Text(
                    'Play Volleyball',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Monserrat',
                      letterSpacing: 2),
                  ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/sports2.png'),
                      fit: BoxFit.fitWidth)),
              ),
              */




        ],
      ),
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