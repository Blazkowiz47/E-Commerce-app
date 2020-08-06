
import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import '../cart.dart';
import './saloon_service_item.dart';
var food_list = [
  {'id': 'Scrub', 'price': 111.2},
  {'id': 'FaceWash', 'price': 987.0},
  {'id': 'Facial', 'price': 346.0},
  {'id': 'Haircut', 'price': 123.0},
];

class SaloonService extends StatefulWidget {
  final String title;
  final String loc;
  final String sum;
  final String location;
  final String description;
  SaloonService({this.title, this.loc, this.sum, this.location, this.description});
  @override
  _SaloonServiceState createState() => _SaloonServiceState();
}

class _SaloonServiceState extends State<SaloonService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 8.397,
              height: double.infinity,
              child: Icon(
                Icons.dehaze,
                color: Colors.white,
              ),
              color: Color.fromRGBO(00, 44, 64, 1),
            ),
            Container(
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: (Row(children: [
          Text(
            "Shop Name",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
            ),
          ),
        ])),
        actions: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(height: 10),
                SearchBar(),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Cart()));
            },
            color: Colors.black,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          CollapsingNavigationDrawer(false),
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(height: 850),
                Positioned(
                  left: 70,
                  top: 30,
                  child: Text(
                    "Men",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(00, 44, 64, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 9,
                  left: MediaQuery.of(context).size.width / 7,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SaloonServiceItem(
                              food_list[0]['id'], food_list[0]['price'], loc: widget.loc, location: widget.location, maintitle: widget.title, sum: widget.sum, description: widget.description,),
                          SizedBox(
                            width: MediaQuery.of(context).size.height <550 ?MediaQuery.of(context).size.width / 40 :
                            MediaQuery.of(context).size.width / 20,
                          ),
                          SaloonServiceItem(
                              food_list[1]['id'], food_list[1]['price'], loc: widget.loc, location: widget.location, maintitle: widget.title, sum: widget.sum,description: widget.description,),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      Row(
                        children: <Widget>[
                          SaloonServiceItem(
                              food_list[2]['id'], food_list[2]['price'], loc: widget.loc, location: widget.location, maintitle: widget.title, sum: widget.sum,description: widget.description,),
                          SizedBox(
                            width: MediaQuery.of(context).size.height <550 ?MediaQuery.of(context).size.width / 40 :
                            MediaQuery.of(context).size.width / 20,
                          ),
                          SaloonServiceItem(
                              food_list[3]['id'], food_list[3]['price'], loc: widget.loc, location: widget.location, maintitle: widget.title, sum: widget.sum,description: widget.description,),
                        ],
                      ),
                    ],
                  ),
                ),
                //Positioned(top: 0, child: CollapsingNavigationDrawer(false)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
