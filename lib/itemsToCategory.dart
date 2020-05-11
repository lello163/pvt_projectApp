/*import 'package:flutter/material.dart';
import 'package:pvt_project/griditem.dart';

class Items extends StatefulWidget {
  @override
  _Itemspage createState() => _Itemspage();
}

class _Itemspage extends State<Items> {
  List<Item> itemList;
  List<Item> selectedList;

  @override
  void initState() {
    loadList();
    super.initState();
  }
  

  loadList() {
    itemList = List();
    selectedList = List();

 SizedBox(height: 10);
   

    itemList.add(Item("assets/food.png", 1, "Fooooool"));
   
    itemList.add(Item("assets/pringles.png", 2, "Katt"));
    /*itemList.add(Item("assets/pringles.png", 3));
    itemList.add(Item("assets/pringles.png", 4));
    itemList.add(Item("assets/pringles.png", 5));
    itemList.add(Item("assets/pringles.png", 6));
    itemList.add(Item("assets/pringles.png", 7));
    itemList.add(Item("assets/pringles.png", 8));
    itemList.add(Item("assets/pringles.png", 9));
    itemList.add(Item("assets/pringles.png", 10));
    itemList.add(Item("assets/pringles.png", 11));
    itemList.add(Item("assets/pringles.png", 12));
 */
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: GridView.builder(
          padding: const EdgeInsets.fromLTRB(20, 30,1, 1000),
          
          itemCount: itemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          
              childAspectRatio: 2,
              crossAxisCount: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return GridItem(
                item: itemList[index],
                isSelected: (bool value) {
                  setState(() {
                    if (value) {
                      selectedList.add(itemList[index]);
                    } else {
                      selectedList.remove(itemList[index]);
                    }
                  });
                  print("$index : $value");
                },
                key: Key(itemList[index].rank.toString()));

          }),
    );
  
  }

  getAppBar() {
    return AppBar(
      title: Text(selectedList.length < 1
          ? "Multi Selection"
          : "${selectedList.length} category selected"),
      actions: <Widget>[
        selectedList.length < 1
            ? Container()
            : InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < selectedList.length; i++) {
                      itemList.remove(selectedList[i]);
                    }
                    selectedList = List();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.delete),
                ))
      ],
    );
  }
}

class Item {
  String imageUrl;
  int rank;
  String text;

  Item(this.imageUrl, this.rank, this.text);
}
*/