import 'package:flutter/material.dart';
import 'package:pvt_project/models/message_model.dart';
import 'package:pvt_project/widgets/category_selector.dart';
import 'package:pvt_project/widgets/favorite_contacts.dart';
import 'package:pvt_project/widgets/recent_chats.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreen createState() => _MessageScreen();  
}

class _MessageScreen extends State<MessageScreen> {
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
    )
  );
}
}