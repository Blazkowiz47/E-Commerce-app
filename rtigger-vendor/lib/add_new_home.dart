import "package:flutter/material.dart";
import 'package:rtiggers/Menu/add_new.dart';
import 'package:rtiggers/Menu/add_new.dart';
import 'package:rtiggers/More/more.dart';
import 'package:rtiggers/OrderScreen/ActiveOrders.dart';
import 'package:rtiggers/PayOut/payout.dart';
import 'package:rtiggers/Profile/profile.dart';
import 'package:rtiggers/colors.dart';

class AddNewHelper extends StatefulWidget {
  @override
  _AddNewHelperState createState() => _AddNewHelperState();
}

class _AddNewHelperState extends State<AddNewHelper>with SingleTickerProviderStateMixin{

  TabController tabController;
  @override
  void initState() {
    tabController=TabController(length: 5, vsync: this, initialIndex: 1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  getBody() {
    return SafeArea(
      child: Row(
        children: [
          Container(
              color: blueColor,
              width: 50,
              child: RotatedBox(
                quarterTurns: 3,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 4,
                  indicatorColor: brownColor,
                  labelColor: brownColor,
                  unselectedLabelColor: Colors.white,
                  // physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  tabs: [
                    Tab(
                        icon: Text("Order")
                    ),

                    Tab(
                      icon: Text("Menu"),
                    ),

                    Tab(
                      icon: Text("Payout"),
                    ),

                    Tab(
                      icon: Text("Profile"),
                    ),

                    Tab(
                      icon: Text("More"),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [

                ActiveOrder(),

                addnew(),

                Payout(),

                ProfilePage(),

                More(),
              ],
            ),
          ),

        ],
      ),
    );
  }
}