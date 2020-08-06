
import 'package:flutter/material.dart';
import 'package:rtiggers/add_new_home.dart';
import 'category_menu.dart';
import 'menu_data.dart';
import 'add_new.dart';
import 'package:rtiggers/Category_menu_home.dart';
import 'package:rtiggers/add_new_home.dart';

import '../colors.dart';


const cardelevation = 10.0;
Color stockactivecolor = Color(0xff006e9e);
Color stockinactivecolor = Colors.grey;
enum stock {
  allitems,
  outofstock,
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  stock selectedstock = stock.allitems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
      );
  }

  getBody() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(children: [Text("2", style: TextStyle(fontWeight: FontWeight.bold))]),
        Padding(padding: EdgeInsets.only(top: y * 0.026)),
        Padding(padding: EdgeInsets.only(left: x * 0.0875, bottom: y * 0.013),
        child: Row(children: [blueText('Menu', y * 0.033)],)),

        Padding(
          padding: EdgeInsets.only(left: x * 0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: x / 3,
                height: y / 20,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      ),
                  onPressed: () {
                    setState(() {
                      selectedstock = stock.allitems;
                    });
                  },

                 color: selectedstock == stock.allitems
                      ? stockactivecolor
                      : stockinactivecolor,
                  textColor: Colors.white,
                  child: Text('All Items(42)', style: TextStyle(fontSize: y * 0.016)),
                ),
              ),
              SizedBox(width: y * 0.01),
              Container(
                width: x / 3,
                height: y / 20,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      ),
                  onPressed: () {
                    setState(() {
                      selectedstock = stock.outofstock;
                    });
                  },
                  color: selectedstock == stock.outofstock
                      ? stockactivecolor
                      : stockinactivecolor,
                  textColor: Colors.white,
                  child: Text('Out of Stock(15)', style: TextStyle(fontSize: y * 0.016)),
                ),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top:  y * 0.015)),
        MenuCard(cardno: 0, items: menu_list[0]['items']),
        Padding(padding: EdgeInsets.only(top:  y * 0.01)),
        MenuCard(cardno: 1, items: menu_list[1]['items']),
        Padding(padding: EdgeInsets.only(top:  y * 0.01)),
        MenuCard(cardno: 2, items: menu_list[2]['items']),
        Padding(padding: EdgeInsets.only(top:  y * 0.01)),
        MenuCard(cardno: 3, items: menu_list[3]['items']),
        Padding(padding: EdgeInsets.only(top:  y * 0.01)),
        MenuCard(cardno: 4, items: menu_list[4]['items']),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: x / 2.5,
              height: y / 20,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: blueColor)),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddNewHelper()),
                    );},
                color: blueColor,
                textColor: Colors.white,
                child: Text('Add New'),
              ),
            ),
          ],
        )
      ],
    );
  }




  blueText(String txt, [double size=22.0]) {
    return Text(txt, style: TextStyle(color: blueColor, fontSize: size, fontWeight: FontWeight.bold, letterSpacing: 0.8),);
  }
}


class MenuCard extends StatelessWidget {
  MenuCard({@required this.cardno,@required this.items});

  final int cardno;
  final int items;

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return SizedBox(
      height: y / 8,
      width: x / 1.25,
      child: Card(
        elevation: cardelevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryMenuHelper()),);
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: x * 0.05, top: y * 0.013, right: x * 0.04),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [blueText(menu_list[cardno]['id'], y * 0.023),
                    Text('Edit'),
                  ],),),
              SizedBox(
                height: y / 36,
              ),
              Padding(
                padding: EdgeInsets.only(left: x * 0.07, bottom: y * 0.011),
                child: Row(
                  children: <Widget>[
                    Text('$items items'),
                    Icon(Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  blueText(String txt, [double size=22.0]) {
    return Text(txt, style: TextStyle(color: blueColor, fontSize: size, fontWeight: FontWeight.bold, letterSpacing: 0.8),);
  }

  }