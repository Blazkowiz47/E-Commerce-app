import "package:flutter/material.dart";
import 'package:rtiggers/OrderScreen/OrderPage.dart';
import 'package:rtiggers/PayIn/payin.dart';
import 'package:rtiggers/PayOut/payout.dart';
import 'package:rtiggers/Profile/profile.dart';
import 'package:rtiggers/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin{

  TabController tabController;
  @override
  void initState() {
    tabController=TabController(length: 4,vsync: this);
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0)),
              color: blueColor,
            ),
            width: 50,
            height: double.infinity,
            child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: TabBar(
                        onTap: (index){
                          //To go to profiles page having no TabBar. If you want TabBar on profile page as well or this shows some performance issues,just delete the code inside onTap.
                          if(tabController.index ==3){
                            tabController.index = 0;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),
                            ));
                          }
                        },
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 4,
                        indicatorColor: brownColor,
                        labelColor: brownColor,
                        unselectedLabelColor: Colors.white,
                        // physics: NeverScrollableScrollPhysics(),
                        controller: tabController,
                        tabs: [
                          Tab(
                            icon: Text("Order",style: TextStyle(fontSize: 18.0),)
                          ),
                          Tab(
                            icon: Text("Payout",style: TextStyle(fontSize: 18.0)),
                          ),
                          Tab(

                            icon: Text("Payin",style: TextStyle(fontSize: 18.0)),
                          ),
                          Tab(
                            icon: Text("Profile",style: TextStyle(fontSize: 18.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 160.0,)
                ],
              ),
            )
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                OrderPage(),
                Payout(),
                Payin(),
                ProfilePage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
