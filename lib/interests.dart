import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InterestsPage extends StatefulWidget {
  //final ValueChanged<bool> isSelected;

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
              foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/fooddrinks.png'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(8),
      child: 
          const Text('Food & Drinks', 
          style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic, letterSpacing: 2),),
      
      //color: Colors.teal[100],
      
    ),
    Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/sports2.png'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(1),
      child: const Text('Sport'),
     // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/sports.png'))),
    ),
   /* Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/sports2.png'), fit: BoxFit.cover),),
      padding: const EdgeInsets.all(8),
      child: const Text('Fitness', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic, letterSpacing: 2)),
      //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/sports2.png'))),
    ), */
    
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
        foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/animals2.png'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(8),
      child: const Text('Animals'),
      //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/animals.png'))),
    ),
   ),
    Container(
      //funkar inte pga inkWell?
     // foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/parents.png'), fit: BoxFit.fitWidth)),
      padding: const EdgeInsets.all(8),
      child: const Text('Parent hang'),
      //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/parent.png'))),
    ),
    Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/film.png'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(8),
      child: const Text('Film'),
      //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/film.png'))),
    ),
     Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/explore2.png'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(8),
      child: const Text('Explore'),
      //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/explore.png'))),
    ),
    Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/nature2.png'), fit: BoxFit.cover),),
      padding: const EdgeInsets.all(1),
      child: const Text('Fitness & Mindfulness'),
      //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/nature.png'))),
    ),
    Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/gaming2.jpg'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(8),
      child: const Text('Gaming'),
      color: Colors.teal[300],
    ),
     Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/music2.png'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(8),
      child: const Text('Music'),
      //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/music.png'))),
    ),
    Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/culture.png'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(1),
      child: const Text('Art & Culture'),
      //color: Colors.teal[200],
    ),
    Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/outdoors2.jpg'), fit: BoxFit.fitWidth),),
      padding: const EdgeInsets.all(1),
      child: const Text('Outdoors'),
      //color: Colors.teal[200],
    ),
   /* Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/culture.png'), fit: BoxFit.fitWidth),),
      color: Colors.green,
      padding: const EdgeInsets.all(8),
    
      child: Center( 
        child: Text('Culture events', style: TextStyle(color: Colors.black
        )),
      
      ),
      
    ),*/
          ]
          
                 )
        
            ); 
        
        }    
      
  } 

