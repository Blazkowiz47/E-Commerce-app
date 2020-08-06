import 'package:flutter/material.dart';
import 'menu.dart';
import 'menu_data.dart';
import '../colors.dart';
import 'add_new.dart';
import 'package:rtiggers/add_new_home.dart';

class categorymenu extends StatefulWidget {
  @override
  _categorymenuState createState() => _categorymenuState();
}

class _categorymenuState extends State<categorymenu> {
  stock selectedstock = stock.allitems;
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: getBody(),
    );
  }


  getBody() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(children: [
          Text("2", style: TextStyle(fontWeight: FontWeight.bold))
        ]),
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
                      isSwitched = true;
                    });
                  },

                  color: selectedstock == stock.allitems
                      ? stockactivecolor
                      : stockinactivecolor,
                  textColor: Colors.white,
                  child: Text('All Items(42)', style: TextStyle(fontSize: y * 0.016)),
                ),
              ),
              SizedBox(width: x * 0.025),
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
                      isSwitched = false;
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

        Padding(padding: EdgeInsets.only(top: y * 0.0195)),

        SizedBox(
          height: y / 8,
          width: x / 1.25,
          child: Card(
            elevation: cardelevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: x * 0.07, top: y * 0.0026, right: x * 0.045),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [blueText(combo_list[0]['id'], y*0.023),
                        Switch(
                              value: isSwitched,
                              onChanged: (value) {
                               setState(() {
                               isSwitched = value;
                                });
                                 },
                                 activeTrackColor: Color(0xff006e9e),
                                    activeColor: blueColor,
                                 ),
                                 ],),),
                  //SizedBox(height: MediaQuery.of(context).size.height  ,),
                  Padding(
                    padding: EdgeInsets.only(left: x * 0.07,bottom: y * 0.0026),
                    child: Row(
                      children: <Widget>[
                        Text('Rate'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        Padding(padding: EdgeInsets.only(top: y * 0.011)),
        SizedBox(
          height: y / 8,
          width: x / 1.25,
          child: Card(
            elevation: cardelevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: x * 0.07, top: y * 0.0026, right: x * 0.045),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [blueText(combo_list[1]['id'], y * 0.023),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Color(0xff006e9e),
                        activeColor: blueColor,
                      ),
                    ],),),
                //SizedBox(height: MediaQuery.of(context).size.height  ,),
                Padding(
                  padding: EdgeInsets.only(left: x * 0.07,bottom: y * 0.0026),
                  child: Row(
                    children: <Widget>[
                      Text('Rate'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(padding: EdgeInsets.only(top: y * 0.011)),
        SizedBox(
          height: y / 8,
          width: x / 1.25,
          child: Card(
            elevation: cardelevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: x * 0.07, top: y * 0.0026, right: x * 0.045),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [blueText(combo_list[2]['id'], y * 0.023),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Color(0xff006e9e),
                        activeColor: blueColor,
                      ),
                    ],),),
                Padding(
                  padding: EdgeInsets.only(left: x * 0.07,bottom: y * 0.0026),
                  child: Row(
                    children: <Widget>[
                      Text('Rate'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(padding: EdgeInsets.only(top: y * 0.011)),
        SizedBox(
          height: y / 8,
          width: x / 1.25,
          child: Card(
            elevation: cardelevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: x * 0.07, top: y * 0.0026, right: x * 0.045),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [blueText(combo_list[3]['id'], y * 0.023),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Color(0xff006e9e),
                        activeColor: blueColor,
                      ),
                    ],),),
                //SizedBox(height: MediaQuery.of(context).size.height  ,),
                Padding(
                  padding: EdgeInsets.only(left: x * 0.07,bottom: y * 0.0026),
                  child: Row(
                    children: <Widget>[
                      Text('Rate'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(padding: EdgeInsets.only(top: y * 0.011)),
        SizedBox(
          height: y / 8,
          width: x / 1.25,
          child: Card(
            elevation: cardelevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: x * 0.07, top: y * 0.0026, right: x * 0.045),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [blueText(combo_list[4]['id'], y*0.023),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Color(0xff006e9e),
                        activeColor: blueColor,
                      ),
                    ],),),
                //SizedBox(height: MediaQuery.of(context).size.height  ,),
                Padding(
                  padding: EdgeInsets.only(left: x * 0.07,bottom: y * 0.0026),
                  child: Row(
                    children: <Widget>[
                      Text('Rate'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),



        SizedBox(height: y * 0.013),
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
                  Navigator.push(context, MaterialPageRoute (builder: (context) =>  AddNewHelper()),);
                },
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
    return new Text(txt, style: new TextStyle(color: blueColor, fontSize: size, fontWeight: FontWeight.bold, letterSpacing: 0.8),);
  }

}