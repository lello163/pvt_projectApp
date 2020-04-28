import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          SizedBox(height: 60),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(3, 60, 0.0, 0.0),
                  child: Text(
                    'Please read through our Terms and Conditions!',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2)),
                
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
       Container(
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextField(
      enabled: false,
      minLines: 10,
      maxLines: 15,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Privacy ang GDPR',
        hoverColor: Colors.black,
        filled: true,
        fillColor: Color(0xFFDBEDFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    ),
  ),
),

         /* //Facebook knapp 

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
 */         
        ]));
  }
}