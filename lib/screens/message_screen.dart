import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:pvt_project/AllActivities.dart';
import 'package:pvt_project/models/message_model.dart';
import 'package:pvt_project/profilepageview.dart';
import 'package:pvt_project/widgets/category_selector.dart';
import 'package:pvt_project/widgets/favorite_contacts.dart';
import 'package:pvt_project/widgets/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreen createState() => _MessageScreen();  
}

class _MessageScreen extends State<MessageScreen> {
  String apiKey = 'AIzaSyCIYW5-ghM8mTSFRgJynHXXnz-bfKhgi_k';

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
    appBar: AppBar(
      title: Text('Chats',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold
      ),  
      ),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {}, 
          )
      ],
    ),
    body: Column(
      children: <Widget> [
        CategorySelector(),
        Expanded(
                  child: Container(
            height: 500,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))),
            child: Column(
              children: <Widget> [
                FavoriteContacts(),
                RecentChats(),
               
              ]
            )
            
          ),
          
        )
        
      ]
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
                color: Colors.blue[700],
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllActivities()),
                  );
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