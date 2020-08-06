import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/ActiveOrders/all_active_orders.dart';
import 'package:rtiggers/ActiveOrders/preparing_active_orders.dart';
import 'package:rtiggers/colors.dart';




class ActiveOrder extends StatefulWidget {
  @override
  _ActiveOrderState createState() => _ActiveOrderState();
}

class _ActiveOrderState extends State<ActiveOrder>
    with SingleTickerProviderStateMixin {
  TabController tabView;
  @override
  void initState() {
    tabView = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Accepting Orders ", style: TextStyle(color: blueColor),),
        elevation: 0,
        bottom: getTabBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
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
    return TabBar(
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.blue[100]
      ),
      // indicatorColor: Colors.black,
      controller: tabView,
      tabs: [
        Tab(
          icon: getTabHeader("ALL"),
          
        ),
        Tab(
          icon: getTabHeader("Preparing"),
        ),
        Tab(
          icon: getTabHeader("Ready"),
        ),
        Tab(
          icon: getTabHeader("Picked"),
        ),
      ],
    );
  }

   getTabHeader(String field) {
    return Text(field, style: TextStyle(color: blueColor,fontWeight: FontWeight.bold, fontSize: 12.0),);
  }

  getBody() {
    return TabBarView(
      controller: tabView,
      children: [
        AllActiveOrders(),
        PreparingActiveOrders(),
        Text("3"),
        Text("4"),
      ],
    );
  }

  
}


