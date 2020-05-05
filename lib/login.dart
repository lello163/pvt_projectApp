import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
                  title: const Text('Login Page'),
                ),
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          SizedBox(height: 60),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(85, 60, 0.0, 0.0),
                  child: Text(
                    'Welcome back!',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2)),
                ),
              ],
            ),
          ),
          
          //Facebook knapp 

          Container(
              padding: EdgeInsets.only(top: 35.0, left: 45.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70.0),
                  Container(
                      height: 100.0,
                      width: 300,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'Continue with Facebook',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat', fontSize: 20),
                            ),
                          ),
                        ),
                      )
                      ),
                ],
              )),
              
              // Google knapp

              Container(
              padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 100.0,
                      width: 300,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'Continue with Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat', fontSize: 20),
                            ),
                          ),
                        ),
                      )
                      ), 
                ],
              )),
              
              //Mail knapp
              Container(
              padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 100.0,
                      width: 300,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'Continue with Email',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat', fontSize: 20),
                            ),
                          ),
                        ),
                      )
                      ), 
                ],
              )),
          
        ]));
  }
}