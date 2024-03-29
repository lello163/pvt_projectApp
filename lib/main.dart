import 'package:flutter/material.dart';
import 'package:pvt_project/screens/message_screen.dart';
import 'signup.dart';
import 'login.dart';
import 'interests.dart';
import 'profilepage.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),

    );
    
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/main.png'), 
        fit: BoxFit.cover,
        ),
      ),
      
    
    
    
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
         Container(
            child: 
              Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 110.0, 0.0, 0.0),
                  child: 
                    Text(
                    'Meet n Greet',
                    style: TextStyle(
                      fontSize: 45.0, color: Colors.white, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2), 
                  ),
                ),
              ],
            )
          ),
          
          //Bild på handskakning
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              ],
            ),
          ),
          
              // Sign in

              SizedBox(height: 200.0, width: 300),
              ButtonTheme(
  minWidth: 300.0,
  height: 87.0,
  child: RaisedButton(
      shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(20.0),
      ),
    onPressed: () {
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignupPage()),
    );
    },

    color: Colors.blue[700],
    child: Text("sign up".toUpperCase(),  style: TextStyle(color: Colors.white,
                      fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', letterSpacing: 2)),
    
  ),
),
              //Log in 
SizedBox(height: 10),              
ButtonTheme(
  minWidth: 300.0,
  height: 87.0,
  child: RaisedButton(
      shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(20.0),
      ),
    onPressed: () {     
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LogInPage())
    );
    },
    color: Colors.blue[700],
    child: Text("login".toUpperCase(),  style: TextStyle(color: Colors.white,
                      fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', letterSpacing: 2)),

  ),
)
        ],
      ),
    ));
  }
}