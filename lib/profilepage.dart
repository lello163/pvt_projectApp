import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'settings.dart';
import 'profilepageview.dart';

List names = [
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
];

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
  Profile({Key key, this.firstName, this.lastName, this.email, this.password, this.selectedGender, this.selectedRelation, this.origin, this.birthDateInString, this.occupation, this.location, this.interest});
  @override
  _ProfileState createState() => _ProfileState(firstName: firstName, lastName: lastName, email: email, password: password,
      selectedGender: selectedGender, selectedRelation: selectedRelation, origin: origin, birthDateInString: birthDateInString, occupation: occupation, location: location, interest: interest);
}

class _ProfileState extends State<Profile> {
String json;
  void createJson (){
   json = "{\"firstName\":\""+firstName+"\",\"lastName\":\""+lastName +"\",\"dateOfBirth\":\"" + birthDateInString + "\",\"gender\":\"" + selectedGender + "\",\"email\":\"" + email + "\",\"relationshipStatus\":\""+ selectedRelation + "\",\"occupation\":\"" + occupation + "\",\"placeOfBirth\":\""+ "NO BIRTHPLACE" +"\",\"placeOfResidence\":\"" + location + "\",\"description\":\""+ description + "\"}";

  }

Future<void> sendToServer() async {
  Map<String, String> headers = {"Content-type": 'application/json; charset=UTF-8'};
  String url = "https://group5-15.pvt.dsv.su.se/user/add";
  Response response = await put(url, headers: headers, body: json);

}
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
String description="";


  _ProfileState({Key key, this.firstName, this.lastName, this.email, this.password, this.selectedGender, this.selectedRelation, this.origin, this.birthDateInString, this.occupation, this.location, this.interest});
  static Random random = Random();
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  /*svoid imagePicker(){
    if (interest.contains('fitness')){
      image1 : AssetImage('assets/nature2.png');
    } 
    if (interest.contains('parentHang')){
      if (image1 = null) {
        image1 : AssetImage('assets/parent2.png');
      } else {
        if (image2 = null) {
          image2 : AssetImage('assets/parent2.png');
        }
      }
    }
    if (interest.contains('gaming')) {
      if (image1 = null) {
        image1 : AssetImage('assets/gaming2.jpg');
      } else {
        if (image2 = null) {
          image2 : AssetImage('assets/gaming2.jpg');
        } else if (image3 = null) {
          image3 : AssetImage('assets/gaming2.jpg');
        }
      }
    }
  } */

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
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

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
                names[random.nextInt(10)],
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
                          ' Location | Origin | Age \n Relationship status | Occupation ',
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
                    createJson();
                    sendToServer();
                    _showProfileSavedMessage();
                  }))),
    );
  }
}
