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

    return new Scaffold(
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
)

              
              
    ]));
            
  }
}