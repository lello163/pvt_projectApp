import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'settings.dart';


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
  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  static Random random = Random();
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
                  title: const Text('Profile'),
                  actions: <Widget>[
                    RaisedButton (
                      child:  Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => SettingsPage()),);
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
                child: CircleAvatar(radius: 80, child: _image == null ?  Icon(Icons.plus_one, ) : Image.file(_image),
)
              )
              ),
              SizedBox(height: 10),
              Text(
                names[random.nextInt(10)],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
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
        hintText: '',
        hoverColor: Colors.black,
        filled: true,
        fillColor: Color(0xFFDBEDFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
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
        hintText: '',
        hoverColor: Colors.black,
        filled: true,
        fillColor: Color(0xFFDBEDFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    ),
  ),
                     ),   
                     
                     
                                               /*SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    color: Colors.grey,
                    onPressed: (){},
                  ),
                  SizedBox(width: 10),
                  FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: (){},
                  ),

                ],
              ),*/

              /*SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Posts",
                          style: TextStyle(
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Friends",
                          style: TextStyle(
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Groups",
                          style: TextStyle(
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ), */
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
                          fontStyle: FontStyle.italic,
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
                      "assets/profil.png",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              
            ],
            
          ),
        ),
      ),
           bottomNavigationBar: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.black, width: 3.0)),
        padding: const EdgeInsets.fromLTRB(4, 5, 5, 5),
        color: Colors.lightBlue,
        child: Text('Save',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                letterSpacing: 2)),
                
        onPressed: () {
          Navigator.push(
            
            context,
            //Till profile sen
            MaterialPageRoute(builder: (context) => Profile()),
          ); 
          
        }
      ),
    );
    
  }
}

