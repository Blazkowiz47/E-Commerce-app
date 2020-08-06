import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/HomeScreen/HomeScreen.dart';
import 'package:rtiggers/OrderScreen/OrderPage.dart';
import 'package:rtiggers/PastOrder/past_order_utility.dart';
import 'package:rtiggers/active_order_home.dart';
import 'package:rtiggers/colors.dart';




class PastOrder extends StatefulWidget {
  @override
  _PastOrderState createState() => _PastOrderState();
}

class _PastOrderState extends State<PastOrder>
    with SingleTickerProviderStateMixin {
  TabController tabView;
  @override
  void initState() {
    tabView = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(child: getTabBar(), preferredSize: Size.fromHeight(100.0)),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height/1.3,
              width: MediaQuery.of(context).size.width - 50.0,
              child: getBody(),
            ),
          ),
          Row(
            children: [
              Container(
                height: y*0.06,
                width: (MediaQuery.of(context).size.width - 52.0) / 2,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Active', style: TextStyle(color: Colors.white)),
                  color: brownColor,
                ),
              ),
              Container(
                height: y*0.06,
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
                height: y*0.06,
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
        Text('Past Orders', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold, fontSize: 17.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton( onPressed: (){
              
              Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: new Text('New Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
            FlatButton(
              onPressed: () {
                
                Navigator.push(context,  MaterialPageRoute(builder: (context) => ActiveOrderHelper()));
              },
              child: new Text('Active Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
            FlatButton(
              onPressed: (){
                Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => PastOrderHelper()));
              },
              child: new Text('Past Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
          ],
        ),
      ],
    );
  }

  getBody() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric( horizontal: x * 0.0203),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: y * 0.007, horizontal: x * 0.023),
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
                    padding: EdgeInsets.symmetric(vertical: y * 0.007, horizontal: x * 0.023),
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
                    height: y*0.05,
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
                            padding: EdgeInsets.symmetric(vertical: y * 0.010, horizontal: x * 0.023), child: Text('10 mins', style: TextStyle(color: Colors.white),)),
                        
                        IconButton(icon: Icon(Icons.add, color: Colors.white,), onPressed: () {}),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: y * 0.010, horizontal: x * 0.023)),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.symmetric(vertical: y * 0.007, horizontal: x * 0.012),
                        height: y*0.05,
                        width: x*0.22,
                        child: Center(
                            child: Text(
                          "Reject",
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: y * 0.010, horizontal: x * 0.023),
                      child: Container(
                        decoration: new BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: y * 0.007, horizontal: x * 0.012),
                        height: y * 0.05,
                        width: x * 0.4,
                        child: FlatButton(onPressed: (){}, child: Text("Accept(00:30)",style: TextStyle(color: Colors.white),)
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}


