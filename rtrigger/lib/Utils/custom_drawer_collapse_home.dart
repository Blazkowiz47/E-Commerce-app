import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/Authentication/login.dart';
import '../cart.dart';
import '../contact.dart';
import '../favourite.dart';
import '../homepage.dart';
import '../main.dart';
import '../main_tabs.dart';
import '../notifications.dart';
import '../order.dart';
import '../profile.dart';
import 'custom_drawer_items_home.dart';



class CollapsingNavigationDrawerHome extends StatefulWidget {
  final bool len;
  CollapsingNavigationDrawerHome(this.len);
  @override
  CollapsingNavigationDrawerHomeState createState() {
    return new CollapsingNavigationDrawerHomeState();
  }
}

class CollapsingNavigationDrawerHomeState
    extends State<CollapsingNavigationDrawerHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double minWidth = MediaQuery.of(context).size.width / 8.397;
    return Material(
      elevation: 80.0,
      child: Container(
        width: minWidth,
        height: (widget.len &&
                210.0 * (Cart_list.length) + (5 * Saloon_item.length) + 270.0 >
                    MediaQuery.of(context).size.height)
           
                ? 180.0 * (Cart_list.length) + (150 * Saloon_item.length) + 330.0
                
            : currentSelectedIndex==5 ? 1100 :   MediaQuery.of(context).size.height,
        color: Color.fromRGBO(00, 44, 64, 1),
        child: Column(
          children: <Widget>[
            if (MediaQuery.of(context).size.height > 500)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, counter) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: InkWell(
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10, bottom: 5),
                              child: Text(
                                navigationItemsHome[counter].title,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height<550? MediaQuery.of(context).size.height*0.015:
                                  MediaQuery.of(context).size.height*0.018 ,
                                  color: currentSelectedIndex == counter
                                      ? Colors.yellowAccent
                                      : Colors.white,
                                ),
                              ),
                            )),
                        onTap: () {
                          setState(() {
                            currentSelectedIndex = counter;
                            if (counter == 0)
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Profile();
                              }));
                            if (counter == 6)
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Homepage();
                              }));
                                    if (counter == 1)
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Nots();
                              }));
                            if (counter == 2)
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Contact();
                              }));
                            if (counter == 3)
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Order();
                              }));
                            if (counter == 4)
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Cart();
                              }));
                            if (counter == 5)
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Favs();
                              }));
                            /*        if (counter == 1)
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ChatScreen();
                              }));
                      */
                          });
                        },
                      ),
                    );
                  },
                  itemCount: navigationItemsHome.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
