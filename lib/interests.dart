/*import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InterestsPage extends StatefulWidget {
  @override
  _InterestsPageState createState() => _InterestsPageState();
  
}

class _InterestsPageState extends State<InterestsPage> {
  @override
  Widget build(BuildContext context) {
    var myList = true;
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
      splashColor: Colors.greenAccent,
      onTap: () => print(myList = false),
   
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
*/
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'selectable_item.dart';
import 'selection_app_bar.dart';

class InterestsPage extends StatefulWidget {
  @override
  _Interestspage createState() => _Interestspage();
}

class _Interestspage extends State<InterestsPage> {
  final controller = DragSelectGridViewController();

  @override
  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectionAppBar(
        selection: controller.selection,
      ),
      body: DragSelectGridView(
        gridController: controller,
        itemCount: 20,
        itemBuilder: (context, index, selected) {
          return SelectableItem(
            index: index,
            selected: selected,
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 80,
        ),
      ),
    );
  }

  void scheduleRebuild() => setState(() {});
}