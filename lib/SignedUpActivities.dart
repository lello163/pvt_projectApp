import 'package:flutter/material.dart';
import 'package:pvt_project/AllActivities.dart';
import 'package:pvt_project/profilepage.dart';
import 'package:pvt_project/screens/message_screen.dart';
import 'EventInfo.dart';
import 'profilepageview.dart';

class SignedUpActivities extends StatefulWidget {
  @override
  _SignedUpActivities createState() => _SignedUpActivities();
}

class _SignedUpActivities extends State<SignedUpActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities I've signed up for"),
        actions: <Widget>[
          IconButton( 
            color: Colors.blue[900],
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Add route to schedule new event.
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
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllActivities()),
                
                );
              },
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
              onPressed: null,
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

          Container(
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
                  color: Colors.blue[700],
                ),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
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
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventInfo()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.location_on),
                iconSize:30,
                onPressed: () {},
              )
            ],
          )),


    );

  }

}