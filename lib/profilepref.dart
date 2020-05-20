import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pvt_project/interests.dart';

class ProfilePrefPage extends StatefulWidget {
  @override
  _ProfilePrefPageState createState() => _ProfilePrefPageState();
}

class _ProfilePrefPageState extends State<ProfilePrefPage> {
  String _selectedGender;
  //String _selectedPart;
  String _selectedRelation;
  String _selectedOccupation;
  String birthDateInString;
  bool isDateSelected = false;
  DateTime birthDate;



  @override
  Widget build(BuildContext context) {
    final _originController = new TextEditingController();
    var _genders = ['Male', 'Female', 'Non-binary'];
    var _relations = ['Singel',
                      'In a relationships',
                      'Married',
                      "Prefer not to say"];
 

    return new Scaffold(
        appBar: AppBar(
          title: const Text('...'),
        ),
        /*bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.location_searching),
              onPressed: (){},
            ),
            Text("Continue"),
            IconButton(icon: Icon(Icons.refresh),
              onPressed: (){
                setState(() {
                });
              },
            ),
          ],
          ),
    ),*/
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
                        child: Text(birthDate == null ? 'Select date of birth' : birthDateInString,
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
                        child: Text(dropDownStringItem) 
                      );
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
                      return DropdownMenuItem<String> (
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem)
                      );
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
                      hintText: 'Stockholm',
                      icon: Icon(Icons.place),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  obscureText: false,
                ),
              ),

              

              /*Container(
                padding: EdgeInsets.fromLTRB(240, 180, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text("Continue",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2,
                        )),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        openPage(context);
                      },
                    ),
                  ],
                ),
              ),*/
            ]
            
            
            ),
            bottomNavigationBar: 
      SizedBox(
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
openPage(context);
          }
      ))));
  }

  void openPage(BuildContext context) {
    final _locationController = TextEditingController();
    var _occupations = ['Working',
                      'Studying',
                      'Unemployed/Looking for a job',
                      "Other"];

    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      
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
                        child: Text (dropDownStringItem)
                        );
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
                    //hintText: 'Skärholmen',
                 /* validator: (String value) {
                    if (value.isEmpty) {
                      return 'You need to write a place!';
                    }
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },*/
                ),
              ),
             /* Container(
                padding: EdgeInsets.fromLTRB(240, 280, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text("Continue",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2,
                        )),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        //samla värden i...array?
                        // add birthplace + _originController
                        // add location + _locationController
                        //add gender + _selectedGender
                        // add relationstatus + _selectedRelation
                        //add occupation + selectedOccupation

                        //add birthDateInString;
                       

                        var route = new MaterialPageRoute(builder: (BuildContext context) => 
                        new InterestsPage());
                        //in med värde i interestpage-metod
                        Navigator.of(context).push(route);
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InterestsPage()));*/
                      },
                    ),
                  ],
                ),
              ),*/
            ],
          ),
          bottomNavigationBar: 
      SizedBox(
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
                       

                        var route = new MaterialPageRoute(builder: (BuildContext context) => 
                        new InterestsPage());
                        //in med värde i interestpage-metod
                        Navigator.of(context).push(route);
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InterestsPage()));*/

          }
          ))));

          
    }));
  }
}
