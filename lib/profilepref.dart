import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ProfilePrefPage extends StatefulWidget {
  @override
  _ProfilePrefPageState createState() => _ProfilePrefPageState();
}

class _ProfilePrefPageState extends State<ProfilePrefPage> {
  @override
  Widget build(BuildContext context) {
    String birthDateInString;
    bool isDateSelected= false;
    DateTime birthDate;
    String _selectedGender; 
    String _selectedPart;
    String _selectedRelation;

  


    return new Scaffold(
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          SizedBox(height: 90),
          Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                  child: Text(
                    'Your date of birth',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2)),
                  ),
            ),
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
            child: Icon(
            Icons.calendar_today),
              ),
      GestureDetector(
        onTap: ()  async {
          final datePick= await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1900),
          lastDate: new DateTime(2100)
      );
          if(datePick!=null && datePick!=birthDate){
          setState(() {
          birthDate = datePick;
          isDateSelected = true;
          birthDateInString = "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
          print(birthDateInString);
        });
      }
    },
        child: Container(
          color: Colors.blue.shade600,
          padding: const EdgeInsets.all(8),
          child: const Text('Select date of birth'),
        ),
      ),
    ],
  ),
),
SizedBox(height: 40),
Container(
  width: 310,
  padding: EdgeInsets.fromLTRB(70, 0 , 0, 0),
  child: new DropdownButton<String>(
    hint: Text('Please choose a gender'),
    focusColor: Colors.black,
    items: <String>['Male', 'Woman', 'Non-binary'].map((String _selectedGender) {
    return new DropdownMenuItem<String>(
      value: _selectedGender,
      child: new Text(_selectedGender),
    );
  }).toList(),
  onChanged: (_) {},
)
),
SizedBox(height: 25),
Container(
  padding: EdgeInsets.fromLTRB(70, 0 , 0, 0),
  child: new DropdownButton<String>(
    hint: Text('Select your relationship status'),
    focusColor: Colors.black,
    items: <String>['Singel', 'In a relationships', 'Married', "Prefer not to say"].map((String _selectedRelation) {
    return new DropdownMenuItem<String>(
      value: _selectedRelation,
      child: new Text(_selectedRelation),
    );
  }).toList(),
  onChanged: (_) {},
)
),
SizedBox(height: 10.0),
 Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  width: 310,
                  child: TextField(
                    decoration: InputDecoration(

                        labelText: 'Where do you come from? ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,),
                            hintText: 'Stockholm',
                            icon: Icon(Icons.place),
                            
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: false,
                  ),             
 ),
 Container(
   padding: EdgeInsets.fromLTRB(255, 260, 0, 0),
            child: Row(
              children: <Widget>[
                  Text(
                    "Continue",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, letterSpacing: 2,)),
               
                IconButton(icon: Icon(Icons.keyboard_arrow_right),
                onPressed: (){},
                ),
                  
                  
                  
                  
            
              ],
            ),
          ),
              
    ]));
            
  }
}