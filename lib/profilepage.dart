import 'dart:convert';
import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pvt_project/CreateEvent.dart';
import 'settings.dart';
import 'profilepageview.dart';

/*List names = [
  "Ling Waldner",
  "Gricelda Barrera",
  "Lenard Milton",
  "Bryant Marley",
  "Rosalva Sadberry",
  "Guadalupe Ratledge",
  "Brandy Gazda",
  "Kurt Toms",
  "Rosario Gathright",
  "Kim Delph",
  "Stacy Christensen",
];*/
class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  final String selectedGender;
  final String selectedRelation;
  final String birthDateInString;
  final String origin;
  final String occupation;
  final String location;
  final String description;
  int age;

  final String interests;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.selectedGender,
      this.selectedRelation,
      this.birthDateInString,
      this.origin,
      this.occupation,
      this.location,
      this.interests,
      this.description});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      firstName: parsedJson['firstName'],
      lastName: parsedJson['lastName'],
      email: parsedJson['email'],
      password: parsedJson['password'],
      selectedGender: parsedJson['gender'],
      selectedRelation: parsedJson['relationshipStatus'],
      birthDateInString: parsedJson['dateOfBirth'],
      origin: parsedJson['placeOfBirth'],
      occupation: parsedJson['occupation'],
      location: parsedJson['placeOfResidence'],
      interests: parsedJson['interests'],
      description: parsedJson['description'],
    );
  }

  calculateAge(DateTime dateOfBirth) {
    DateTime currentDate = DateTime.now();
    age = currentDate.year - dateOfBirth.year;
    int month1 = currentDate.month;
    int month2 = dateOfBirth.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = dateOfBirth.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  String getName() {
    return (firstName + " " + lastName);
  }

  String getEmail(){
    return email;
  }
  String getBirthDate(){
    return birthDateInString;
  }

  String getPassword(){
    return password;
  }
  String getGender(){
    return selectedGender;
  }

  String getRelation(){
    return selectedRelation;
  }

  String getOrigin(){
    return origin;
  }

  String getLocation(){
    return location;
  }
  String getOccupation(){
    return occupation;
  }

  String getDescription(){
    return description;
  }
  String getInterests(){
    return interests;
  }
  
  }

class Profile extends StatefulWidget {


  String firstName ="";
  String lastName ="";
  String email="";
  String password="";

  String selectedGender;
  String selectedRelation;
  String birthDateInString;
  String origin;
  String occupation;
  String location;


  String interest;
  Profile({Key key, this.email});
  @override
  _ProfileState createState() => _ProfileState(email: email);
}

class _ProfileState extends State<Profile> {
  User user;

 // String firstName ="";
  //String lastName ="";
  String email="";
  String password="";

  String selectedGender;
  String selectedRelation;
  String birthDateInString;
  String origin;
  String occupation;
  String location;

  String interest;
  String description="";
  String userID="";

  DateTime age;


  _ProfileState({Key key, this.email});
  static Random random = Random();
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future<void> getUserFromServer() async {
    print("count starting");
   await new Future.delayed(const Duration(seconds : 7));
    print("count done");
    String urlEmailToID = "https://group5-15.pvt.dsv.su.se/user/get/id?email="+ email;
    Response responseID= await get(urlEmailToID);
    userID = responseID.body;
    print(userID);
    String urlUserByID = "https://group5-15.pvt.dsv.su.se/user/get?id="+userID;
    Response rep2 = await get(urlUserByID);
    var dataJson = json.decode(rep2.body);
    user = new User.fromJson(dataJson);
 //   print(user.firstName + user.lastName + user.location);
  }

  void updateUserDescription(){
    Map<String, String> headers = {"Content-type": 'application/json; charset=UTF-8'};
    String jsonInfo = "{\"type\":\"description\", \"data\":\""+ description + "\"}";
    String url =  "https://group5-15.pvt.dsv.su.se/user/update?id=" + userID;
    http.put(url, headers: headers, body: jsonInfo);
  }

  void updatePageWithUserInfo(){
    setState(() {

    });
  }


  Future<void> _showProfileSavedMessage() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Saved'),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your profile page has been saved.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  //Till profile sen
                  MaterialPageRoute(builder: (context) => ProfilePage(user: user, userID: userID)),
                );
              },
            ),
          ],
        );
      },
    );
  }

  bool done = false;
  @override
  Widget build(BuildContext context) {
if(!done){
  getUserFromServer();
  done = true;
}
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
              GestureDetector(
                  onTap: getImage,
                  child: Container(
                      child: CircleAvatar(
                    radius: 80,
                    child: _image == null
                        ? Icon(
                            Icons.plus_one,
                          )
                        : Image.file(_image),
                  ))),
              SizedBox(height: 10),
              Text(
                'Joanne M. ',
               // User.getName();
               //det här funkade 4 gånger, sen slutade det funka????
               //user.firstName + " " + user.lastName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 3),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: TextField(
                    enabled: true,
                    minLines: 3,
                    maxLines: 3,
                    autocorrect: true,
                    decoration: InputDecoration(
                     hintText:
                     'Vasastan | Austin \n  25 years | In a relationship | Working',
                     //den säger att metoden toUpperCase is called on null, alltså finns inte location?
                     //'Location: ' + user.location.toUpperCase() + ' | Age: ' + user.calculateAge(DateTime.parse(birthDateInString)) + ' | Origin: ' + user.origin + ' | Relationship status: ' + user.selectedRelation + ' | Occupation: ' + user.occupation,
 //                         ' Location: ' + user.getLocation() + ' | Origin: ' + user.getOrigin() + ' Relationship status: ' + user.getRelation()  + ' | Age: ' + user.getBirthDate() + ' | Occupation: ' + user.getOccupation(),
                    
                      hoverColor: Colors.black,
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        //borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 4, 15, 10),
                  child: TextField(

                    enabled: true,
                    minLines: 3,
                    maxLines: 3,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Something interesting about who I am...',
                      hoverColor: Colors.black,
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                child: Center(
                  child: const Text(
                    'Interests',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Monserrat',
                        letterSpacing: 2),
                  ),
                ),
              ),
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
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: 70,
          width: 150,
          child: Align(
              alignment: FractionalOffset(0.9, 0.3),
              child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue[700],
                  child: Text('Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Monserrat',
                          letterSpacing: 2)),
                  onPressed: () {
                    updatePageWithUserInfo();
                    getUserFromServer();
                    _showProfileSavedMessage();
                  }))),
    );
  }
}
