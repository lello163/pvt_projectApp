import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InterestsPage extends StatefulWidget {
  //final ValueChanged<bool> isSelected;
  //int _isSelected = 0;

  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  bool isSelected = false;
  int counter = 0;
  //var shape = Brightness.dark;
  var shape = BoxShape.rectangle;

  void _changeState() {
    setState(() {
      if (isSelected = false)
        shape = BoxShape.circle;
        isSelected = true;
     // else,
     //   isSelected = false;
     //   shape = Brightness.dark;


      
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text('What are your interests?'),
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
            

            children: <Widget>[
              Container(
                child: const Text('Choose as many categories as you like'),
              ),
              GestureDetector(
                onTap: () {
                  _changeState();
                },
              child: Container(
                //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/fooddrinks.png'), fit: BoxFit.fitWidth),),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Food & Drinks',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                decoration: BoxDecoration(
                    shape: shape,
                    image: DecorationImage(
                        image: AssetImage('assets/fooddrinks.png'),
                        fit: BoxFit.fitWidth)),
              ),),
              GestureDetector(
                onTap: (){
                  _changeState();
                },
              child: Container(
                //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/sports2.png'), fit: BoxFit.fitWidth),),
                padding: const EdgeInsets.all(1),
                child: const Text(
                  'Sport',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                decoration: BoxDecoration(
                    shape: shape,
                    image: DecorationImage(
                        image: AssetImage('assets/sports2.png'),
                        fit: BoxFit.fitWidth)),
              ),),
              Container(
                //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/animals2.png'), fit: BoxFit.fitWidth),),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Animals',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/animals2.png'),
                        fit: BoxFit.fitWidth)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Parent hang',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/parent2.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Film',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/film.png'),
                        fit: BoxFit.fitWidth)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Explore',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                //culture & outdoors
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/explore2.png'),
                        fit: BoxFit.fitWidth)),
              ),
              Container(
                padding: const EdgeInsets.all(1),
                child: const Text(
                  'Fitness & Mindfulness',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/nature2.png'),
                        fit: BoxFit.fitWidth)),
              ),
              Container(
                //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/gaming2.jpg'), fit: BoxFit.fitWidth),),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Gaming',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/gaming2.jpg'),
                        fit: BoxFit.fitWidth)),
              ),
              Container(
                //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/music2.png'), fit: BoxFit.fitWidth),),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Music',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/music2.png'),
                        fit: BoxFit.fitWidth)),
              ),
              InkWell(
                onTap: () {
                  counter++;
                  setState(() {});
                },
              )
            ]));
  }
}

/* InkWell(
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
   */

/*
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
    */
/* Container(
      foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/culture.png'), fit: BoxFit.fitWidth),),
      color: Colors.green,
      padding: const EdgeInsets.all(8),
    
      child: Center( 
        child: Text('Culture events', style: TextStyle(color: Colors.black
        )),
      
      ),
      
    ),*/
