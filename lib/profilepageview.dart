import 'package:flutter/material.dart';
import 'package:pvt_project/AllActivities.dart';
import 'package:pvt_project/screens/message_screen.dart';
import 'EventInfo.dart';
import 'settings.dart';
import 'profilepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: <Widget>[
          IconButton(
              color: Colors.blue[900],
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25),
              Container(
                  child: CircleAvatar(
                      radius: 80,
                      child: Icon(
                        Icons.plus_one,
                      ))),
              SizedBox(height: 10),
              Text(
                'Firstname Lastname',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Monserrat',
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 3),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
                color: Colors.transparent,
                child: Text('Location | Origin | Age \n Relationship status | Occupation', 
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w500, 
                  fontFamily: 'Monserrat'),
                  textAlign: TextAlign.center,
                  ),
              ),
              SizedBox(height: 3),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 15, 70),
                color: Colors.transparent,
                child: Text('Something interesting about who I am...', 
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w500, 
                  fontFamily: 'Monserrat')),
               ),
              SizedBox(height: 3),
              Container(
                  padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                  child: Center(
                    child: const Text(
                      'Interests',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0,
                        fontFamily: 'Monserrat',
                        letterSpacing: 2,
                      ),
                    ),
                  )),
              SizedBox(height: 8),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.all(5),
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 200 / 200,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/fooddrinks.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
              SizedBox(height: 10),
              ButtonTheme(
                minWidth: 250.0,
                height: 40.0,
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    padding: const EdgeInsets.fromLTRB(4, 5, 5, 5),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                    color: Colors.blue[700],
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Monserrat',
                          letterSpacing: 2),
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.blue[700],
                ),
                iconSize: 30,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                iconSize: 30,
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessageScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllActivities()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.location_on),
                iconSize:30,
                onPressed: () {},
              )
            ],
          )),
    );
  }
}
