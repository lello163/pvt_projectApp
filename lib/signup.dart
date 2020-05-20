import 'package:flutter/material.dart';
import 'main.dart';
import 'profilepref.dart';
import 'login.dart';
import 'package:pvt_project/signupWithFB';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'TermsandCond.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert' as JSON;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool checkboxValue = false;
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupWithFB()));
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
    var text = Text('I agree to the ');
    String firstName;
    String lastName;
    String selectedPassword;

    return new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Sign up Page'),
            ),
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(70, 50, 0.0, 0.0),
                        child: Text('Welcome to Meet n Greet',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 2)),
                      ),
                    ],
                  ),
                ),

                Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'FIRSTNAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[200]),
                                hintText: 'Firstname',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            onSaved: (String newName) {
                              firstName = newName;
                            }),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'LASTNAME ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400]),
                              hintText: 'Lastname',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                          //obscureText: true,
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'EMAIL ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]),
                                hintText: 'Email',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue))),
                            onSaved: (String newLastname) {
                              lastName = newLastname;
                            }),
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[850]),
                              hintText: 'Password',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                          onSaved: (String newPassword) {
                            selectedPassword = newPassword;
                          },
                          obscureText: true,
                        ),
                        CheckboxListTile(
                          value: checkboxValue,
                          onChanged: (val) {
                            setState(() {
                              checkboxValue = !checkboxValue;
                            });
                          },
                          subtitle: !checkboxValue
                              ? Text(
                                  'Required.',
                                  style: TextStyle(color: Colors.red),
                                )
                              : null,
                          title: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return Terms();
                                  },
                                ),
                              );
                            },
                            child: Text('I agree to the Terms and Conditions.',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.blue[700])),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.green,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                            height: 35.0,
                            width: 300,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue[700],
                              elevation: 7.0,
                              child: RaisedButton(
                                onPressed: () {
                                  if (checkboxValue) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePrefPage()));
                                  } else {
                                    Alert(
                                        context: context,
                                        title: 'Please accept \n Terms & conditions',
                                        desc:
                                            'You need to accept the Terms & conditions to be able to register an account.',
                                        buttons: [
                                          DialogButton(
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text('OK',
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ))),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            color: Colors.transparent,
                                          )
                                        ]).show();
                                  }
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Create an account',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                                color: Colors.blue[700],
                              ),
                            )),
                        Container(
                          padding: const EdgeInsets.only(top: 40, bottom: 5),
                          child: Text(
                              '- - - - - - - - - - - - O R - - - - - - - - - - -',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17.0),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          
                         // padding: const EdgeInsets.all(5),
                          padding: EdgeInsets.only(top: 10),
                          child: Column(children: <Widget>[

                            
                        SizedBox(height: 5.0),
                        Container(
                          
                          //padding: const EdgeInsets.all(0),
                          height: 50.0,
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
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: SizedBox(
                                              height: 20,
                                              width: 10,
                                              child: Align(
                                                alignment: FractionalOffset(0.3, 0.3),
                                              child: Image.asset(
                                                  'assets/icons_fboldwhite.png'),
                                    ))),
                                          Expanded(
                                            child: RaisedButton(
                                              color: Colors.blue[700],
                                            child: Text('Logout', style: TextStyle(color: Colors.white)),
                                            onPressed: () {
                                              _logout();
                                            },
                                            )),
                                          Expanded( 
                                            child: Row(
                                              children: <Widget>[
                                              RaisedButton(
                                               
                                            color: Colors.blue[700],
                                                //child: Align(
                                                //  alignment: FractionalOffset(0.2, 0.5),
                                                //  widthFactor: 30,
                                                  // borderRadius: BorderRadius.circular(20.0),
                                            child: Text("Continue", style: TextStyle(color: Colors.white)),
                                            //),
                                            onPressed: () {
                                              Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupWithFB()));
                                            },
                                          )])),
                                        ],
                                      )
                                    : Center(
                                        child: OutlineButton(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Image.asset(
                                                  'assets/icons_fboldwhite.png'),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 220,
                                              padding: EdgeInsets.only(
                                                  top: 17.0,
                                                  left: 5.0),
                                              child: Text(
                                                'Continue with Facebook',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Montserrat',
                                                    //fontSize: 16
                                                    ),
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
                          ),)])),
                        SizedBox(height: 5.0),
                        Container(
                            height: 50.0,
                            width: 300,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              // color: Colors.blue[700],
                              elevation: 7.0,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                          'assets/icons_googlewhite.png'),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 220,
                                      padding:
                                          EdgeInsets.only(top: 17, left: 5),
                                      child: Text(
                                        'Create an account with Google',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    )
                                  ],
                                )),
                                color: Colors.blue[700],
                              ),
                            )),
              ])) ],
                )),
              );
  }
}
