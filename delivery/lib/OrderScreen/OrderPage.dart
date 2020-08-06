import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/OrderScreen/active_cash_on_delivery.dart';
import 'package:rtiggers/colors.dart';

import 'ActiveOrders.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin{
  TabController tabView;
  String name = "name";
  int selectedIndex = 1;


  @override
  void initState() {
    tabView=TabController(length: 3,vsync: this,initialIndex: 1);
    getName();
    super.initState();
  }

  @override
  void dispose() {
    tabView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Welcome $name",style: TextStyle(fontSize: 24.0,color: blueColor, fontWeight: FontWeight.bold),),
        elevation: 0,
        bottom: getTabBar(),
      ),
      body: getBody(),

    );
  }

  getTabBar() {
    return TabBar(
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
      labelColor: blueColor,
      labelStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
      indicatorWeight: 1.0,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      controller: tabView,
      tabs: [
        Tab(
          child: getTab('New Order',0),
//          text: 'New Order',
        ),
        Tab(
//          text: 'Active Order',
          child: getTab('Active Order',1),
        ),
        Tab(
//          text: "Past Order",
          child: getTab('Past Order',2),
        )
      ],
    );
  }

  getBody() {
    return TabBarView(
      controller: tabView,
      children: [
        Text("1"),
        ActiveOrderCashOnDelivery(),
        Text("3"),
      ],
    );
  }

  getTab(String field,int index) //USED A CONTAINER WITH TabView LISTENER TO KEEP UP WITH THE PRESENTED UI, HOWEVER , FOR BETTER PERFORMANCE NORMAL INDICATOR IS A BETTER CHOICE (one commented above in tabs section).
  {
    tabView.addListener(() {
      setState(() {});
    });
    if(tabView.index == index){
      return Container(
        height: 36.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color:blueColor.withOpacity(0.2),
        ),
        child: Center(child: Text(field, style: TextStyle(color: blueColor),),),
      );
    }else{
      return Container(
        height: 36.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color:Colors.grey.withOpacity(0.6),
        ),
        child: Center(child: Text(field, style: TextStyle(color: Colors.black),),),
      );
    }

  }


//  getTabHeader(String field) {
//    return Padding(
//      padding: const EdgeInsets.only(left : 6.0, right : 6.0),
//      child: Text(field, style: TextStyle(color: blueColor,fontWeight: FontWeight.bold,fontSize: 14.5),),
//    );
//  }

  getName() async {

    var user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance.collection('delivery-users').document(user.uid).get().then((value) {
        setState(() {
          name = value.data['name'];
        });
    });

  }
}
