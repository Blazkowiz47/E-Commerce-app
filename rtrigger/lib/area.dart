import 'package:flutter/material.dart';
import 'Utils/custom_drawer_collapse.dart';
import 'Utils/search_bar.dart';
import 'Payment/tansactiondone.dart';
import 'cart.dart';

class Area extends StatefulWidget {
  @override
  _AreaState createState() => _AreaState();
}

class _AreaState extends State<Area> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width / 2 + 50,
            child: Image.asset(
              'images/rtigger47.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.16,
            top: MediaQuery.of(context).size.height * 0.04,
            child: Text(
              "Sanitizer and Spray",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Color.fromRGBO(00, 44, 64, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          CollapsingNavigationDrawer(false),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Color.fromRGBO(0, 44, 64, 1)),
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter the Area in Sq.Ft.',
                  hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Color.fromRGBO(0, 44, 64, 1)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  //filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.4,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => DonePage(7)));
                },
                child: Text("Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    )),
                color: Color.fromRGBO(00, 44, 64, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
