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
  //Selection variables
  bool sportSelected = false;
  double sportOpacity = 1;
  bool foodSelected = false;
  double foodOpacity = 1;
  bool animalsSelected = false;
  double animalsOpacity = 1;
  bool parentHangSelected = false;
  double parentHangOpacity = 1;
  bool filmSelected = false;
  double filmOpacity = 1;
  bool exploreSelected = false;
  double exploreOpacity = 1;
  bool fitnessSelected = false;
  double fitnessOpacity = 1;
  bool gamingSelected = false;
  double gamingOpacity = 1;
  bool musicSelected = false;
  double musicOpacity = 1;



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




  selectedInterest(int interestID){
    switch(interestID){
      case 1:
        if(foodSelected){
          foodSelected = false;
          foodOpacity = 1;
        } else {
          foodSelected = true;
          foodOpacity= 0.3;
        }
        break;
      case 2:
        if(sportSelected){
          sportSelected = false;
          sportOpacity = 1;
        } else {
          sportSelected = true;
          sportOpacity = 0.3;
        }
        break;
      case 3:
        if(animalsSelected){
          animalsSelected = false;
          animalsOpacity = 1;
        } else {
          animalsSelected = true;
          animalsOpacity = 0.3;
        }
        break;
      case 4:
        if(parentHangSelected){
          parentHangSelected = false;
          parentHangOpacity = 1;
        } else {
          parentHangSelected = true;
          parentHangOpacity = 0.3;
        }
        break;
      case 5:
        if(filmSelected){
          filmSelected = false;
          filmOpacity = 1;
        } else {
          filmSelected = true;
          filmOpacity = 0.3;
        }
        break;
      case 6:
        if(exploreSelected){
          exploreSelected = false;
          exploreOpacity = 1;
        } else {
          exploreSelected = true;
          exploreOpacity = 0.3;
        }
        break;
      case 7:
        if(fitnessSelected){
          fitnessSelected = false;
          fitnessOpacity = 1;
        } else {
          fitnessSelected = true;
          fitnessOpacity = 0.3;
        }
        break;
      case 8:
        if(gamingSelected){
          gamingSelected= false;
          gamingOpacity = 1;
        } else {
          gamingSelected = true;
          gamingOpacity = 0.3;
        }
        break;
      case 9:
        if(musicSelected){
          musicSelected = false;
          musicOpacity = 1;
        } else {
          musicSelected = true;
          musicOpacity = 0.3;
        }
        break;
    }
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
                  selectedInterest(1);
                  _changeState();
                },
                child: Container(
                  //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/fooddrinks.png'), fit: BoxFit.fitWidth),),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: const Text(
                      'Food & Drinks',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: shape,
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(foodOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/fooddrinks.png'),
                          fit: BoxFit.fitWidth)),
                ),),
              GestureDetector(
                onTap: (){
                  selectedInterest(2);
                  _changeState();

                },
                child: Container(
                  //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/sports2.png'), fit: BoxFit.fitWidth),),
                  padding: const EdgeInsets.all(1),
                  child: Center(
                    child: const Text(
                      'Sport',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: shape,
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(sportOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/sports2.png'),
                          fit: BoxFit.fitWidth)),
                ),),
              GestureDetector(
                onTap: () {
                  selectedInterest(3);
                  _changeState();

                },
                child: Container(
                  //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/animals2.png'), fit: BoxFit.fitWidth),),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: const Text(
                      'Animals',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(animalsOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/animals2.png'),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectedInterest(4);
                  _changeState();

                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: const Text(
                      'Parent hang',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(parentHangOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/parent2.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  selectedInterest(5);
                  _changeState();

                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: const Text(
                      'Film',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(filmOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/film.png'),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectedInterest(6);
                  _changeState();

                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: const Text(
                      'Explore',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  //culture & outdoors
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(exploreOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/explore2.png'),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectedInterest(7);
                  _changeState();

                },
                child: Container(
                  padding: const EdgeInsets.all(1),
                  child: Center(
                    child: const Text(
                      'Fitness & Mindfulness',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(fitnessOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/nature2.png'),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectedInterest(8);
                  _changeState();

                },
                child: Container(
                  //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/gaming2.jpg'), fit: BoxFit.fitWidth),),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: const Text(
                      'Gaming',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(gamingOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/gaming2.jpg'),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectedInterest(9);
                  _changeState();
                },
                child: Container(
                  //foregroundDecoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/music2.png'), fit: BoxFit.fitWidth),),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: const Text(
                      'Music',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2),
                    ),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(musicOpacity),
                              BlendMode.dstATop),
                          image: AssetImage('assets/music2.png'),
                          fit: BoxFit.fitWidth)),
                ),
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
