import 'package:pvt_project/ChooseCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pvt_project/InfoAboutCreatingActivity.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateEventState();
  }
}

class _CreateEventState extends State<CreateEvent> {
  bool men = false;
  bool women = false;
  //int _currentValue = 2;
  DateTime dateTime;
  //int initialIntegerValue = 2;
  int numberOfParticipants = 2;
  int minimumAge = 18;
  int maximumAge = 99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomMenu(context),
      body: Center(
        child: Column(children: <Widget>[
          topMenu(context),
          textBox(context, 'Name of event'),
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: textBox(context, 'Location'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 62),
            child: Row(
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    "Date picker",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext builder) {
                          return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height /
                                  3,
                              child: CupertinoDatePicker(
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (DateTime newDate) {
                                    dateTime = newDate;
                                  },
                                  use24hFormat: true,
                                  maximumDate: new DateTime(2025, 12, 30),
                                  maximumYear: DateTime.now().year + 2,
                                  minuteInterval: 1,
                                  mode: CupertinoDatePickerMode.date));
                        });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: MaterialButton(
                    child: Text(
                      "Time",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                                height: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .height /
                                    3,
                                child: CupertinoDatePicker(
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (DateTime newDate) {},
                                    use24hFormat: true,
                                    minuteInterval: 1,
                                    mode: CupertinoDatePickerMode.time));
                          });
                    },
                  ),
                ),
                Container(
                  width: 40,
                  child: Icon(Icons.access_time),
                ),
              ],
            ),
          ),
          textBoxLarge(context, "Add description"),
          Padding(
            padding: const EdgeInsets.only(left: 61.0, top: 10),
            child: Row(
              children: <Widget>[
                Text("Who can sign up?    Men: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Checkbox(
                    value: men,
                    activeColor: Colors.blue,
                    onChanged: (bool newValue) {
                      setState(() {
                        men = newValue;
                      });
                    }),
                Text("Women: ", style: TextStyle(fontWeight: FontWeight.bold)),
                Checkbox(
                    value: women,
                    activeColor: Colors.blue,
                    onChanged: (bool newValue) {
                      setState(() {
                        women = newValue;
                      });
                    }),
              ],
            ),
          ),

          Row(
            // crossAxisAlignment: CrossAxisAlignment.values[3],
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 120,
                  child: RaisedButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue,
                    child: Text("Participants: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: () {
                      _numberPickerDialog();
                    },
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                color: Colors.grey[200],
                child: Text(numberOfParticipants.toString(),
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: () {
                      _minAgePickerDialog();
                    },
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                color: Colors.grey[200],
                child: Text(minimumAge.toString(),
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: () {
                      _maxAgePickerDialog();
                    },
                  )),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                color: Colors.grey[200],
                child: Text(maximumAge.toString(),
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
            ],
          ),

          Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                minWidth: 250,
              child: RaisedButton(
                color: Colors.blue,
                child: Text("Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateEvent()),
                  );
                },
              ))),
        ]),
      ),
    );
  }

  /*  void _showAlertDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return(
              new NumberPickerDialog.integer(
                minValue: 2,
                maxValue: 8,
                initialIntegerValue: _currentValue,

              )
          );
        }
    );
  }
*/

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
          print("PROFILE PAGE");
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
