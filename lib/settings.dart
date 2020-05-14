import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(children: <Widget>[
          Container(
            child: Row(children: <Widget>[
              Icon(Icons.notifications_active),
              Text('Notifications'),
            ]),
          ),
          Container(
            child: Row(children: <Widget>[
              Icon(Icons.lock_outline),
              Text('Change password'),
            ],)
          ),
          Container(
            child: Row(children: <Widget>[
              Icon(Icons.exit_to_app),
              Text('Sign out'),
            ],)
          ),
          Container(
            child: Row(children: <Widget>[
              Icon(Icons.pause_circle_outline),
              Text('Pause account'),
            ],)
          ),
          Container(
            child: Row(children: <Widget>[
              Icon(Icons.delete_outline),
              Text('Delete account'),
            ])
          ),
        ]));
  }
}
