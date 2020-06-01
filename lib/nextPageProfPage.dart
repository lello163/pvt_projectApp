//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pvt_project/interests.dart';

class NextProfilePrefPage extends StatefulWidget {
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";

  String selectedGender;
  String selectedRelation;
  String birthDateInString;
  String origin;

  NextProfilePrefPage(
      {Key key,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.selectedGender,
      this.selectedRelation,
      this.origin,
      this.birthDateInString});
  @override
  _NextProfilePrefPageState createState() => _NextProfilePrefPageState(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      selectedGender: selectedGender,
      selectedRelation: selectedRelation,
      origin: origin,
      birthDateInString: birthDateInString);
}

class _NextProfilePrefPageState extends State<NextProfilePrefPage> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String origin;

  String selectedGender;
  //String _selectedPart;
  String selectedRelation;
  String _selectedOccupation;
  String birthDateInString;
  bool isDateSelected = false;
  DateTime birthDate;

  _NextProfilePrefPageState(
      {Key key,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.selectedGender,
      this.selectedRelation,
      this.origin,
      this.birthDateInString});

  @override
  Widget build(BuildContext context) {
    print(firstName +
        lastName +
        email +
        password +
        selectedGender +
        selectedRelation +
        origin +
        birthDateInString);
    var _occupations = [
      'Working',
      'Studying',
      'Unemployed/Looking for a job',
      "Other"
    ];
    final _locationController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('...'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(36, 55, 0.0, 0.0),
                    child: Text('Tell us more about yourself',
                        style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 2)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
                padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: new DropdownButton<String>(
                  hint: Text('What is your main occupation?'),
                  focusColor: Colors.black,
                  items: _occupations.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem));
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      this._selectedOccupation = newValue;
                    });
                  },
                  value: _selectedOccupation,
                )),
            SizedBox(height: 50.0),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              width: 330,
              child: TextFormField(
                controller: _locationController,
                //autovalidate: true,
                decoration: InputDecoration(
                    labelText: 'Where in Stockholm do you live? *',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    icon: Icon(Icons.place),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                obscureText: false,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'You need to write a place!';
                  }
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                },
              ),
            ),
          ],
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
                    child: Text('Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Monserrat',
                            letterSpacing: 2)),
                    onPressed: () {
                      //samla värden i...array?
                      // add birthplace + _originController
                      // add location + _locationController
                      //add gender + _selectedGender
                      // add relationstatus + _selectedRelation
                      //add occupation + selectedOccupation

                      //add birthDateInString;

                      var route = new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new InterestsPage());
                      //in med värde i interestpage-metod
                      Navigator.of(context).push(route);
                    }))));
  }
}
