import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'profilepref.dart';
import 'login.dart';
import 'package:flutter/gestures.dart';
import 'TermsandCond.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool checkboxValue = false;
  String firstName ="";
  String lastName ="";
  String email="";
  String password="";
  final firstNameCon = new TextEditingController();
  final lastNameCon = new TextEditingController();
  final emailCon = new TextEditingController();
  final passwordCon = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    var text = Text('I agree to the ');

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
                                fontSize: 18.0,
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
                          controller: firstNameCon,
                          decoration: InputDecoration(
                              labelText: 'FIRST NAME',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              hintText: 'First name',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: lastNameCon,
                          decoration: InputDecoration(
                              labelText: 'LAST NAME',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              hintText: 'Last name',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                          

                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: emailCon,
                          decoration: InputDecoration(
                              labelText: 'EMAIL ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              hintText: 'Email',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: passwordCon,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              hintText: 'Password',
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
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

                                  setState(() {
                                    firstName = firstNameCon.text;
                                    lastName = lastNameCon.text;
                                    email = emailCon.text;
                                    password = passwordCon.text;
                                    });
                                  if (checkboxValue) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePrefPage(firstName: firstName, lastName: lastName, email: email, password: password)));
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
                          padding: const EdgeInsets.all(20),
                          child: Text(
                              '- - - - - - - - - - - - - O R - - - - - - - - - - - - -',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                              textAlign: TextAlign.center),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                            height: 50.0,
                            width: 300,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue[700],
                              elevation: 7.0,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogInPage()));
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox( height: 20 , width:20,
                                    child: Image.asset('assets/icons_fboldwhite.png'),),
                                    Container(
                                       height: 50, width: 220,
                                       padding: EdgeInsets.only(top: 17, left: 5),
                                      child: Text(
                                      'Create an account with Facebook',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat'),
                                    ),)
                                  ],
                                )),
                                color: Colors.blue[700],
                              ),
                            )),
                        SizedBox(height: 5.0),
                        Container(
                            height: 50.0,
                            width: 300,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              elevation: 7.0,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogInPage()));
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(height: 20, width: 20,
                                    child: Image.asset('assets/icons_googlewhite.png'),),
                                    Container(
                                      height: 50, width: 220,
                                      padding: EdgeInsets.only(top: 17, left: 5),
                                    child: Text(
                                      'Create an account with Google',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat'),
                                    ),)
                                  ],
                                )),
                                color: Colors.blue[700],
                              ),
                            )),
                      ],
                    )),
              ],
            )));
  }
}
