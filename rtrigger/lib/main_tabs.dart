import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rtrigger/main.dart';
import 'Authentication/login_signup.dart';
import 'Food/hotel_name.dart';
import 'Liquor/liquor.dart';
import 'package:rtrigger/Saloon/saloon.dart';
import 'Medical/medical_shop.dart';
import 'Sanitizer/gradients.dart';
import 'Sanitizer/sanitizing.dart';
import 'Utils/custom_drawer_collapse.dart';
import 'Utils/custom_drawer_collapse_home.dart';
import 'Utils/search_bar.dart';
import 'cart.dart';

var food_list = [
  {'id': 'Medicine', 'loc': 'images/ugf.png', 'page': MedicalShop()},
  {'id': 'Food', 'loc': 'images/y.png', 'page': HotelName()},
  {'id': 'Liquor', 'loc': 'images/r.png', 'page': Liquor()},
  {'id': 'Salon & Beauty Parlor', 'loc': 'images/k.png', 'page': Saloon()},
  {
    'id': 'Sanitizer and Spray',
    'loc': 'images/j.png',
    'page': SanitizingPage()
  },
  {'id': 'View All', 'loc': null, 'page': null},
];
String phoneNumber;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  void getuser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    phoneNumber =
        user == null ? '9108650970' : user.email.split('@').removeAt(0);
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    updateCart();
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
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              'Hello, ' + user,
              style: TextStyle(
                  color: Color.fromRGBO(00, 44, 64, 1.0),
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
          ],
        ),
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
      body: SafeArea(
        child: StreamBuilder(
          stream: Firestore.instance.collection('user-activity').document(phoneNumber).collection("cart").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            print("************************************");
            print(snapshot.data.documents.length);
            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: !(MediaQuery.of(context).size.height < 750)
                              ? MediaQuery.of(context).size.height
                              : 740),
                      //Positioned(top: 0, child: CollapsingNavigationDrawer(false)),
                      /*   Container(
                        height:600,
                        child: GridView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                            padding: EdgeInsets.only(left: 60),
                            children:
                                Meals_list.map((tx) => Grads(tx['id'], tx['loc'], tx['page']))
                                    .toList(),
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: MediaQuery.of(context).size.height/4,
                                childAspectRatio: 1.25,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20)),
                    ),
                   */
                      Positioned(
                        left: 60,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Grads(food_list[0]['id'], food_list[0]['loc'],
                                    food_list[0]['page']),
                                Grads(food_list[1]['id'], food_list[1]['loc'],
                                    food_list[1]['page']),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Grads(food_list[2]['id'], food_list[2]['loc'],
                                    food_list[2]['page']),
                                Grads(food_list[3]['id'], food_list[3]['loc'],
                                    food_list[3]['page']),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Grads(food_list[4]['id'], food_list[4]['loc'],
                                    food_list[4]['page']),
                                Grads(food_list[5]['id'], food_list[5]['loc'],
                                    food_list[5]['page']),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        top: MediaQuery.of(context).size.height < 550
                            ? MediaQuery.of(context).size.height * 0.65
                            : MediaQuery.of(context).size.height * 0.55,
                        right: 15,
                        left: 55,
                        child: Container(
                          child: Image.asset(
                            'images/po.png',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width - 60,
                          ),
                        ),
                      ),
                      //          CollapsingNavigationDrawer(),
                    ],
                  ),
                ),
                CollapsingNavigationDrawerHome(false),
              ],
            );
          }
        ),
      ),
    );
  }
}


void updateCart()async{
  print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
  print('initState started loading cart');
  bool value = true;
  List<DocumentSnapshot> ds;
  try{
    QuerySnapshot snapshot =  await Firestore.instance
      .collection("user-activity")
      .document(phoneNumber)
      .collection("cart")
      .getDocuments();
    ds = snapshot.documents;
  }catch(e){
    value = false;
  }

  print(ds.length);
  print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
//  if (ds.length != 0) {
//    for (int i = 0; i < ds.length; i++) {
//      print(ds[i].data);
////      Cart_list.add(ds[i].data);
//    }
//  }
//
//
//   print(Cart_list);
//  //This part is working fine
//   print('Loading Completed');
//   grandTotal =  await  Firestore.instance
//       .collection("user-activity")
//       .document(phoneNumber)
//       .collection("total")
//       .document("total")
//       .get().then((value) {
//     if (value == null){
//       return 0.0;
//     }
//     else
//       return value['total'];
//   });
//   print(grandTotal);
//   print('InitState Completed');
//   print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

}