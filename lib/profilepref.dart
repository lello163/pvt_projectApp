//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pvt_project/interests.dart';
import 'package:pvt_project/nextPageProfPage.dart';

class ProfilePrefPage extends StatefulWidget {
  //Mottagna variabler
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";

  //Här tas strängarna med info om användaren emot
  ProfilePrefPage(
      {Key key, this.firstName, this.lastName, this.email, this.password});
  @override
  _ProfilePrefPageState createState() => _ProfilePrefPageState(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password);
}

class _ProfilePrefPageState extends State<ProfilePrefPage> {
  //Mottagna strängar
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";

  String _selectedGender;
  String genderCorrectFormat;
  String relationCorrectFormat;
  //String _selectedPart;
  String _selectedRelation;
  String _selectedOccupation;
  String birthDateInString;
  bool isDateSelected = false;
  DateTime birthDate;
  String origin;

  //Här tas strängarna med info om användaren emot
  _ProfilePrefPageState(
      {Key key, this.firstName, this.lastName, this.email, this.password});


  void formatRelation(){
    switch(_selectedRelation){
      case 'Single':
        relationCorrectFormat = 'SINGLE';
        break;
      case 'In a relationship':
        relationCorrectFormat = 'INRELATIONSHIP';
        break;
      case 'Married':
        relationCorrectFormat= 'MARRIED';
        break;
      case 'Prefer not to say':
        relationCorrectFormat = 'PREFEREDNOTTOSAY';
        break;
    }
  }
  void formatGender(){
    genderCorrectFormat = _selectedGender.toUpperCase();
  }
  @override
  Widget build(BuildContext context) {
    final _originController = new TextEditingController();
    var _genders = ['Male', 'Female', 'Non-binary'];
    var _relations = [
      'Single',
      'In a relationship',
      'Married',
      "Prefer not to say"
    ];

    return new Scaffold(
        appBar: AppBar(
          title: const Text('...'),
        ),
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 90),
              Container(
                child: Stack(
                  children: <Widget>[
                    Center(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: FractionalOffset.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_today, size: 35),
                    ),
                    GestureDetector(
                      child: RaisedButton(
                        onPressed: () async {
                          final datePick = await showDatePicker(
                              context: context,
                              initialDate: new DateTime.now(),
                              firstDate: new DateTime(1900),
                              lastDate: new DateTime(2100));
                          if (datePick != null && datePick != birthDate) {
                            setState(() {
                              birthDate = datePick;
                              isDateSelected = true;
                              birthDateInString =
                                  "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
                              print(birthDateInString);
                              Text(birthDateInString);
                            });
                          }
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        color: Colors.blue[700],
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 50, right: 50),
                        child: Text(
                            birthDate == null
                                ? 'Select date of birth'
                                : birthDateInString,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Monserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                  width: 310,
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: new DropdownButton<String>(
                    hint: Text('Please choose a gender'),
                    focusColor: Colors.black,
                    items: _genders.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem));
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        this._selectedGender = newValue;
                      });
                    },
                    value: _selectedGender,
                  )),
              SizedBox(height: 25),
              Container(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: new DropdownButton<String>(
                    hint: Text('Select your relationship status'),
                    focusColor: Colors.black,
                    items: _relations.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem));
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {

                        this._selectedRelation = newValue;
                      });
                    },
                    value: _selectedRelation,
                  )),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                width: 310,
                child: TextFormField(
                  controller: _originController,
                  decoration: InputDecoration(
                      labelText: 'Where are you from? ',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      icon: Icon(Icons.place),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  obscureText: false,
                ),
              ),
            ]),
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
                      origin = _originController.text;
                      formatRelation();
                      formatGender();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextProfilePrefPage(
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                password: password,
                                selectedGender: genderCorrectFormat,
                                selectedRelation:relationCorrectFormat,
                                origin: origin,
                                birthDateInString: birthDateInString)),
                      );
                    }))));
  }
}
