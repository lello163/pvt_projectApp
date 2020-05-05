import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InterestsPage extends StatefulWidget {
  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
                  title: const Text('Interests'),
                ),
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          SizedBox(height: 50),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(50, 10, 0.0, 0.0),
                  child: Text(
                    'What are your interests?',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2)),
                ),
              ],
            ),
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(38, 10, 0.0, 0.0),
                  child: Text(
                    'Choose as many categories as you like',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, letterSpacing: 2)),
                ),
              ],
            ),
          ),
   
                    ],
                 )
            ); 
        }    
      
  } 
