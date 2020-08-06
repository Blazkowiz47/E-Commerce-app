import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: getTabBar(), preferredSize: Size.fromHeight(100.0)),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width - 50.0,
              child: getBody(),
            ),
          ),
          Row(
            children: [
              Container(
                height: 45.0,
                width: (MediaQuery.of(context).size.width - 52.0) / 2,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Active', style: TextStyle(color: Colors.white)),
                  color: brownColor,
                ),
              ),
              Container(
                height: 45.0,
                decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 2.0,
                      ),
                    ),
                    color: Colors.black),
                child: Text(''),
              ),
              Container(
                height: 45.0,
                width: (MediaQuery.of(context).size.width - 52.0) / 2,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Inactive', style: TextStyle(color: Colors.white)),
                  color: brownColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

    getTabBar() {

    return Column(
      children: [
        SizedBox(height: 6.0,),
        Text('New Orders', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold, fontSize: 17.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton( onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrder()));
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NewOrder()) );
            },
            child: new Text('New Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
            FlatButton(
              onPressed: () {},
              child: new Text('Active Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
            FlatButton(
              onPressed: (){},
              child: new Text('Past Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
          ],
        ),
      ],
    );
  }

  getBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "ID: 171111111111111",
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Spacer(),
                      Text(
                        'Time',
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text('Name of the person \t\t\t\t 1st Order'),
                ),
                Text(
                  'Total Bill : Rs. amount',
                  style: TextStyle(color: Colors.white),
                ),
                Text('1 Chicken Egg Dosa ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blueColor,
                        fontSize: 16.0)),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 18.0, 18.0, 18.0),
                  child: Text('Set food preparation time'),
                ),
                Center(
                  child: Container(
                    height: 35.0,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(icon: Icon(Icons.remove, color: Colors.white,), onPressed: () {}),
                        Padding(
                            padding: EdgeInsets.all(5.0), child: Text('10 mins', style: TextStyle(color: Colors.white),)),
                        
                        IconButton(icon: Icon(Icons.add, color: Colors.white,), onPressed: () {}),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0),),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.all(5),
                        height: 35.0,
                        width: 90.0,
                        child: Center(
                            child: Text(
                          "Reject",
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(5),
                        height: 35.0,
                        width: 125.0,
                        child: FlatButton(onPressed: (){}, child: Text("Accept(00:30)",style: TextStyle(color: Colors.white),)
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
