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
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 90),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
                height: 70,
                width: 300,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.notifications_active),
                      Container(
                        height: 70,
                        width: 200,
                        padding:
                            EdgeInsets.only(top: 20.0, left: 45.0, right: 20.0),
                        child: Text('Notifications',
                            style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5)),
                      ),
                    ]),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
                  height: 70,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.lock_outline),
                      Container(
                        height: 70,
                        width: 200,
                        padding:
                            EdgeInsets.only(top: 20.0, left: 45.0, right: 20.0),
                        child: Text('Change password',
                            style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5)),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
                  height: 70,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      Container(
                        height: 70,
                        width: 200,
                        padding:
                            EdgeInsets.only(top: 20.0, left: 45.0, right: 20.0),
                        child: Text('Sign out',
                            style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5)),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
                  height: 70,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.pause_circle_outline),
                      Container(
                        height: 70,
                        width: 200,
                        padding:
                            EdgeInsets.only(top: 20.0, left: 45.0, right: 20.0),
                        child: Text('Pause account',
                            style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5)),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
                  height: 70,
                  width: 300,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.delete_outline),
                        Container(
                          height: 70,
                          width: 200,
                          padding: EdgeInsets.only(
                              top: 20.0, left: 45.0, right: 20.0),
                          child: Text('Delete account',
                            style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5)),
                        ),
                      ])),
            ]));
  }
}

/*
Alert(
      context: context,
      type: AlertType.warning,
      title: "ALERT",
      desc: "Are you sure you want to PAUSE your account?",
      buttons: [
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          ]),
        )
      ],
    ).show();
  */
