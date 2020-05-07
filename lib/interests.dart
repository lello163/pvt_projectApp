import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InterestsPage extends StatefulWidget {
  //final ValueChanged<bool> isSelected; hej

  @override
  _InterestsPageState createState() => _InterestsPageState();
  
}

class _InterestsPageState extends State<InterestsPage> {  
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
                  title: const Text('Interests'),
                ),
                
        resizeToAvoidBottomPadding: false,
        body: GridView.count(
            padding: const EdgeInsets.all(30),
          childAspectRatio: (6 / 1),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // Create a grid with 1 columns.
          crossAxisCount: 1,
          // Generate 100 widgets that display their index in the List.
          children: <Widget> [
            Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Food & Drinks'),
      color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: const Text('Sport'),
      color: Colors.teal[200],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Fitness'),
      color: Colors.teal[300],
    ),
    
    InkWell(
        onTap: (){     
      setState(() {
          isSelected = !isSelected;
          if(isSelected){
             return Colors.black;
          }else{
             return Colors.green;
          }
      });
      },
      child: Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Animals'),
      color: Colors.red,
    ),
   ),
    Container(
      padding: const EdgeInsets.all(1),
      child: const Text('Parent hang'),
      color: Colors.teal[200],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Film'),
      color: Colors.teal[300],
    ),
     Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Explore'),
      color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: const Text('Nature'),
      color: Colors.teal[200],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Gaming'),
      color: Colors.teal[300],
    ),
     Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Music'),
      color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(1),
      child: const Text('Art'),
      color: Colors.teal[200],
    ),
    Container(
      color: Colors.green,
      padding: const EdgeInsets.all(8),
    
      child: Center( 
        child: Text('Culture events', style: TextStyle(color: Colors.black
        )),
      
      ),
      
    ),
          ]
          
                 )
        
            ); 
        
        }    
      
  } 

