import 'package:flutter/material.dart';
import 'profilepref.dart';
import 'login.dart' ;
import 'package:flutter/gestures.dart';
import 'TermsandCond.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool checkboxValue = false;
  
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
    child: 
    Scaffold(
       appBar: AppBar(
                  title: const Text('Sign up Page'),
                ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(70, 50, 0.0, 0.0),
                  child: Text(
                    'Welcome to Meet n Greet',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2)),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Firstname',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                            hintText: 'Firstname',

                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'LASTNAME ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                            hintText: 'Lastname',
                          

                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'EMAIL ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                            hintText: 'Email' ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                            hintText: 'Password' ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
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
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return Terms();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'I agree to the Terms and Conditions.',
                    style: TextStyle(fontSize: 14.0, color: Colors.blue)
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.green,
              ),
                  SizedBox(height: 5.0),
                  Container(
                      height: 50.0,
                      width: 300,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePrefPage())
                            );
                          },
                          shape: new RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(30.0),
                         side: BorderSide(color: Colors.black, width: 3.0)
                           ),
                          child: Center(
                            child: Text(
                              'Create an account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                          color: Colors.lightBlue,
                        ),
                      )),
 //                     child: Text(''),
 Container(
   padding: const EdgeInsets.all(20),
   child: Text('- - - - - - - - - - - - - O R - - - - - - - - - - - - -', 
   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0), 
   textAlign: TextAlign.center ),
 ),
         SizedBox(height: 5.0),
                  Container(
                      height: 50.0,
                      width: 300,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                            context,
   //                         MaterialPageRoute(builder: (context) => ProfilePrefPage())
                              MaterialPageRoute(builder: (context) => LogInPage())
                            );
                          },
                          shape: new RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(30.0),
                         side: BorderSide(color: Colors.black, width: 3.0)
                           ),
                          child: Center(
                            child: Text(
                              'Create an account with Facebook',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                          color: Colors.lightBlue,
                        ),
                      )),
                SizedBox(height: 5.0),
                  Container(
                      height: 50.0,
                      width: 300,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            //MaterialPageRoute(builder: (context) => ProfilePrefPage())
                            MaterialPageRoute(builder: (context) => LogInPage())
                            );
                          },
                          shape: new RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(30.0),
                         side: BorderSide(color: Colors.black, width: 3.0)
                           ),
                          child: Center(
                            child: Text(
                              'Create an account with Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                          color: Colors.lightBlue,
                        ),
                      )),
                ],
                
              )),
            
                ],
              )
        ));
  }
}