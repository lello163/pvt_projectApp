import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'profilepage.dart';
//import 'package:convert/convert.dart' as JSON;

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }

  _logout() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Login Page'),
            ),
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              SizedBox(height: 60),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(85, 60, 0.0, 0.0),
                      child: Text('Welcome back!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 2)),
                    ),
                  ],
                ),
              ),

              //Facebook knapp
              //Yaaaas
              Container(
                  padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70.0),
                      Container(
                          height: 70.0,
                          width: 300,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue[700],
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: _isLoggedIn
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Image.network(
                                              userProfile["picture"]["data"]
                                                  ["url"],
                                              height: 70.0,
                                              width: 70.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(userProfile["name"]),
                                          ),
                                          Expanded(
                                              child: OutlineButton(
                                            child: Text("Logout"),
                                            onPressed: () {
                                              _logout();
                                            },
                                          )),
                                        ],
                                      )
                                    : Center(
                                        child: OutlineButton(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: Image.asset(
                                                  'assets/icons_fboldwhite.png'),
                                            ),
                                            Container(
                                              height: 70,
                                              width: 200,
                                              padding: EdgeInsets.only(
                                                  top: 25.0,
                                                  left: 10.0,
                                                  right: 10.0),
                                              child: Text(
                                                'Continue with Facebook',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16),
                                              ),
                                            )
                                          ],
                                        ),
                                        onPressed: () {
                                          _loginWithFB();
                                          
                                        },
                                      )),
                              ),
                            ),
                          )),
                    ],
                  )),

              // Google knapp

              Container(
                  padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 70.0,
                          width: 300,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue[700],
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Image.asset(
                                        'assets/icons_googlewhite.png'),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 200,
                                    padding: EdgeInsets.only(
                                        top: 25.0, left: 10.0, right: 10.0),
                                    child: Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Montserrat',
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          )),
                    ],
                  )),

              //Mail knapp
              Container(
                  padding: EdgeInsets.only(top: 10.0, left: 45.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 70.0,
                          width: 300,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue[700],
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                   SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: Image.asset(
                                        'assets/icons_mail.png'),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 200,
                                    padding: EdgeInsets.only(
                                        top: 25.0, left: 10.0, right: 10.0),
                                    child: Text(
                                      'Continue with Email',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Montserrat',
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              )),
                            ),
                          )),
                    ],
                  )),
            ])));
  }
}
