import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

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
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          
          //Namn på appen tjansssssa
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Meet n Greet',
                    style: TextStyle(
                      fontSize: 35.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2),
                  ),
                ),
              ],
            )
          ),
          
          //Bild på handskakning
          //Test
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: ImageIcon(AssetImage('assets/handshake.png'), size: 200.0),
                )
              ],
            ),
          ),
          
              // Sign in

              SizedBox(height: 200.0),
              ButtonTheme(
  minWidth: 300.0,
  height: 70.0,
  child: RaisedButton(
      shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
      side: BorderSide(color: Colors.black, width: 3.0)
      ),
    onPressed: () {
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignupPage()),
    );
    },

    color: Colors.lightBlue,
    child: Text("sign in".toUpperCase(),  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2)),
    
  ),
),
              //Log in 
SizedBox(height: 10),              
ButtonTheme(
  minWidth: 300.0,
  height: 70.0,
  child: RaisedButton(
      shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
      side: BorderSide(color: Colors.black, width: 3.0)
      ),
    onPressed: () {     
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LogInPage())
    );
    },
    color: Colors.lightBlue,
    child: Text("login".toUpperCase(),  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2)),

  ),
)
        ],
      ),
    );
  }
}