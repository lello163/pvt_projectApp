import 'package:http/http.dart';
import 'package:pvt_project/ChooseCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pvt_project/InfoAboutCreatingActivity.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:http/http.dart' as http;

import 'Frequency.dart';
import 'profilepageview.dart';

class CreateEvent extends StatefulWidget {
  String userID = "";
  String category;
  CreateEvent({Key key, this.userID, this.category});

  @override
  State<StatefulWidget> createState() {
    return _CreateEventState(userID: userID.toString(), category: category);
  }
}

String name = "";
String time = "";
String description = "";
String categoryOfActivity = "";
String minAge = "";
String maxAge = "";
String groupSize = "";
String allowedGender = "";
String location = "";
String coordinates = "";
String setTime = "Time";
String setDate = "Date";
DateTime selectedDate = DateTime.now();

final eventName = new TextEditingController();
final eventDescription = new TextEditingController();

class _CreateEventState extends State<CreateEvent> {
  String userID;
  String category;
  String json;
  void createJson() {
    json = "{\"name\":\"" +
        name +
        "\",\"time\":\"" +
        time +
        "\",\"description\":\"" +
        description +
        "\",\"catergoryOfActivity\":\"" +
        categoryOfActivity +
        "\",\"minAge\"_\"" +
        minAge +
        "\",\"maxAge\":\"" +
        maxAge +
        "\",\"groupSize\":\"" +
        groupSize +
        "\",\"allowedGender\":\"" +
        allowedGender +
        "\",\"location\":\"" +
        location +
        "\",\"coordinates\":\"" +
        coordinates +
        "\"}";
  }

  _CreateEventState({Key key, this.userID, this.category});

  Future<void> sendToServer() async {
    Map<String, String> headers = {
      "Content-type": 'application/json; charset=UTF-8'
    };
    String url = "https://group5-15.pvt.dsv.su.se/activity/add";
    http.put(url, headers: headers, body: json);
    addCreator();
  }

  Future<void> addCreator() async {
    Map<String, String> headers = {
      "Content-type": 'application/json; charset=UTF-8'
    };
    String url =
        "/activity/participate?user=" + userID + "19753&activity=214193";
    http.put(url, headers: headers, body: json);
  }

  bool differentGenders = false;
  DateTime dateTime;
  int numberOfParticipants = 2;
  int minimumAge = 18;
  int maximumAge = 99;

  @override
  Widget build(BuildContext context) {
    final _locationController = new TextEditingController();
    final _nameController = new TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
        bottomNavigationBar: bottomMenu(context),
        body: Center(
          child: Expanded(
            flex: 2,
            child: Column(children: <Widget>[
              topMenu(context),
              Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 14, 0),
                  width: 300,
                  height: 50,
                  child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name of event'))),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0, right: 5),
                    child: GestureDetector(
                      onTap: () {
                        print("MAP");
                      },
                      child: Container(
                        width: 40,
                        child: Icon(Icons.edit_location),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 25, 0),
                    width: 300,
                    height: 50,
                    child: TextFormField(
                        controller: _locationController,
                        decoration: InputDecoration(labelText: 'Location')),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 62),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        child: RaisedButton(
                      child:
                          Text(setDate, style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                      onPressed: () async {
                        final datePick = await showDatePicker(
                            context: context,
                            initialDate: new DateTime.now(),
                            firstDate: new DateTime.now(),
                            lastDate: new DateTime(2022));
                        setState(() {
                          setDate =
                              "Date(${datePick.month}/${datePick.day}/${datePick.year})";
                        });
                      },
                    )),
                    GestureDetector(
                      child: RaisedButton(
                        child:
                          Text(setTime, style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                      onPressed: () async {
                        final timePick = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        setState(() {
                          setTime = "${timePick.toString()} ";
                          //selectedTime.toString();
                        });
                      },
                    )),

                   
                    /*Container(
                      width: 40,
                      child: Icon(Icons.access_time),
                    ),*/
                  ],
                ),
              ),
              textBoxLarge(context, "  Add description"),

              Padding(
                  padding: const EdgeInsets.only(left: 75.0, top: 10),
                  child: Row(children: <Widget>[
                    Checkbox(
                        value: differentGenders,
                        activeColor: Colors.blue,
                        onChanged: (bool newValue) {
                          setState(() {
                            differentGenders = newValue;
                            if (newValue = true) {
                              allowedGender = 'ALL';
                            } else {
                              allowedGender = 'NONE';
                            }
                          });
                        }),
                    Text(
                        "I want people of different \n genders to be able to sign up",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 120,
                      child: RaisedButton(
                        padding: const EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text("Participants: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () {
                          _numberPickerDialog();
                        },
                      )),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    color: Colors.grey[200],
                    child: Text(numberOfParticipants.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),

              // okay ages to participate
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 120,
                      child: RaisedButton(
                        padding: const EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text("Minimum age: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () {
                          _minAgePickerDialog();
                        },
                      )),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    color: Colors.grey[200],
                    child: Text(minimumAge.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 120,
                      child: RaisedButton(
                        padding: const EdgeInsets.all(10),
                        color: Colors.blue,
                        child: Text("Maximum age: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () {
                          _maxAgePickerDialog();
                        },
                      )),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    color: Colors.grey[200],
                    child: Text(maximumAge.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),

              Container(
                  width: 300,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  alignment: Alignment.bottomCenter,
                  child: ButtonTheme(
                      minWidth: 250,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("Continue",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        onPressed: () {
                          createJson();
                          sendToServer();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Frequency()),
                          );
                        },
                      ))),
            ]),
          ),
        ));
  }


  void _numberPickerDialog() {
    showDialog<int>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            initialIntegerValue: numberOfParticipants,
            minValue: 2,
            maxValue: 8,
            title: new Text('Pick maximum amount of participants',
                style: TextStyle()),
          );
        }).then((int _currentValue) {
      if (_currentValue != null) {
        setState(() => numberOfParticipants = _currentValue);
      } else {
        setState(() => numberOfParticipants);
      }
    });
  }

  void _minAgePickerDialog() {
    showDialog<int>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
              minValue: 18,
              maxValue: 99,
              initialIntegerValue: minimumAge,
              title: new Text('What is the minimum age to participate?'));
        }).then((int _currentValue) {
      if (_currentValue != null) {
        setState(() => minimumAge = _currentValue);
      } else {
        setState(() => minimumAge);
      }
    });
  }

  void _maxAgePickerDialog() {
    showDialog<int>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
              minValue: 18,
              maxValue: 99,
              initialIntegerValue: maximumAge,
              title: new Text('What is the maximum age to participate?'));
        }).then((int _currentValue) {
      if (_currentValue != null) {
        setState(() => maximumAge = _currentValue);
      } else {
        setState(() => maximumAge);
      }
    });
  }

  Widget datetime() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        print(newdate);
      },
      use24hFormat: true,
      maximumDate: new DateTime(2018, 12, 30),
      minimumYear: 2010,
      maximumYear: 2018,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.dateAndTime,
    );
  }

  Widget textBox(BuildContext context, String hintText) {
    return Container(
        height: 30,
        width: 270,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        ));
  }
}

Widget textBoxLarge(BuildContext context, String hintText) {
  return Container(
      height: 130,
      width: 270,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ));
}

Widget topMenu(BuildContext context) {
  return (Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 10.0),
        child: RaisedButton.icon(
          label: Text("Back"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChooseCategory()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: FlatButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InfoAboutCreatingActivity()),
            );
          },
          icon: Icon(Icons.help),
          label: Text(""),
        ),
      ),
    ],
  ));
}

Widget bottomMenu(BuildContext context) {
  return BottomAppBar(
      child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.person),
        color: Colors.black,
        iconSize: 40,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
            //print("PROFILE PAGE"
          );
        },
      ),
      IconButton(
        icon: Icon(Icons.message),
        color: Colors.black,
        iconSize: 40,
        onPressed: () {
          print("MESSAGE PAGE");
        },
      ),
      IconButton(
        icon: Icon(Icons.calendar_today),
        color: Colors.blue,
        iconSize: 40,
        onPressed: () {
          print("pressed");
        },
      ),
      IconButton(
        icon: Icon(Icons.location_on),
        color: Colors.black,
        iconSize: 40,
        onPressed: () {
          print("MAP PAGE");
        },
      ),
    ],
  ));
}
