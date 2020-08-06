import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rtrigger/main_tabs.dart';
import 'Payment/Payment.dart';
import 'Utils/custom_drawer_collapse.dart';
import 'Utils/custom_drawer_collapse_home.dart';
import 'cart_item.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'main.dart';
int hour;
int minute;
int itemNumber;
bool noItem = true;
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool delete = false;
  //<<<<<<< HEAD
//  getTotal() {
//  double temptotal = 0;
//  for (int i = 0; i < Cart_list.length; i++)
//    temptotal += Cart_list[i]['count'] * Cart_list[i]['sum'];
//  setState(() {
//    total = temptotal;
//  });
//}
  @override
  void initState() {
    itemNumber = 2;
    super.initState();
  }
  int lastItem = 0;
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: Row(
//          children: <Widget>[
//            Container(
//              width: MediaQuery.of(context).size.width / 8.397,
//              height: double.infinity,
//              child: Icon(
//                Icons.dehaze,
//                color: Colors.white,
//              ),
//              color: Color.fromRGBO(00, 44, 64, 1),
//            ),
//            Container(
//              color: Colors.white,
//            )
//          ],
//        ),
//        backgroundColor: Colors.transparent,
//        elevation: 0.0,
//        automaticallyImplyLeading: false,
//        title: Text(
//          "My Cart",
//          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//        ),
//        actions: <Widget>[
//          FlatButton(
//              onPressed: () {
//                setState(() {
//                  delete = true;
//                  Cart_list = [];
//                  Saloon_item = [];
//                });
//              },
//              child: Text(
//                "Clear Cart",
//                style: TextStyle(color: Colors.red),
//              ))
//        ],
//      ),
//      body: Stack(
//        children: <Widget>[
//          Container(
//              height: (210.0 * (Cart_list.length) +
//                          (150 * Saloon_item.length) +
//                          270.0 >
//                      MediaQuery.of(context).size.height)
//                  ? 180.0 * (Cart_list.length) +
//                      (150 * Saloon_item.length) +
//                      330.0
//                  : MediaQuery.of(context).size.height
//          ),
//          Positioned(
//            bottom: 0,
//            child: Center(
//              child: Column(
//                children: <Widget>[
//                  Image.asset(
//                    'images/rtigger37.png',
//                    fit: BoxFit.cover,
//                    width: MediaQuery.of(context).size.width,
//                  ),
//                ],
//              ),
//            ),
//          ),
//          SingleChildScrollView(
//            physics:AlwaysScrollableScrollPhysics(),
//            child: StreamBuilder(
//                stream: Firestore.instance.collection('user-activity').document(phoneNumber).collection("cart").snapshots(),
//                builder: (context, snapshot) {
//                  if (!snapshot.hasData)
//                    return Center(child: CircularProgressIndicator());
//
//                  return Container(
//                    height: MediaQuery.of(context).size.height*0.89,
//                    child: ListView.builder(
//                        //padding: EdgeInsets.only(bottom: 0,top),
//                        scrollDirection: Axis.vertical,
//                        itemExtent: 200,
//                        shrinkWrap: true,
//                        itemCount: snapshot.data.documents.length,
//                        itemBuilder: (context, index) {
//                          DocumentSnapshot ds = snapshot.data.documents[index];
//                          itemNumber = snapshot.data.documents.length;
//                          deleteCart() async {
//                            await Firestore.instance.runTransaction((Transaction myTransaction) async {
//                              await myTransaction.delete(ds.reference);
//                              delete = false;
//                            });
//                          }
//                         if(delete){
//                           lastItem = 0;
//
//                           deleteCart();
//                           return Container();
//                         }else {
//                             lastItem = index + 1 ;
//                           return cartitem(
//                             img: ds["imgloc"],//'images/ii.png',
//                             rate: ds["rate"],
//                             id: ds["id"],
//                             onpress: () {},
//                           );
//                         }
//                        }),
//                  );
//                }),
//          ),
//         /* Positioned(
//            bottom: 25.0,
//            // right: 25.0,
//            child: Container(
//              height: 80.0,
//              width: 150.0,
//              child: Card(
//                color: Colors.blue,
//                elevation: 12.0,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: [
//                    Text('Total Amount: - '),
//                    Text('Checkout Now !'),
//                  ],
//                ),
//              ),
//            )
//            ),*/
//          /* Expanded(
//           child: Container(
//             child: StreamBuilder(
//                 stream: Firestore.instance.collection("cart").snapshots(),
//
//               builder: (context,snapshot){
//                 if(!snapshot.hasData) return const Text('loading....');
//               return ListView.builder(
//               //padding: EdgeInsets.only(bottom: 0,top),
//               scrollDirection: Axis.vertical,
//               itemExtent:200,
//
//               shrinkWrap: true,
//
//               itemBuilder: (context, index) {
//               DocumentSnapshot ds = snapshot.data.documents[index];
//               print(ds['id']);
//               print(ds['rate']);
//               print(ds['imgloc']);
//               //print(ds['fav']);
//
//
//
//
//                 return Container(child:
//                    cartitem(img:'images/ii.png',
//                   id:ds['id'],
//                   rate: ds['rate'],
//                   onpress:(){}));
//
//
//                 },
//               itemCount: 1,//snapshot.data.documents.length,
//
//
//               );}
//             ),
//           ),
//         ),*/
//          /* Container(
//            height: 180.0 * Cart_list.length + 200,
//            child: Column(
//              children: <Widget>[
//                for (int i = 0; i < Cart_list.length; i++)
//                  Padding(
//                    padding: const EdgeInsets.only(
//                        bottom: 15.0, left: 60, right: 10),
//                    child: Card(
//                      elevation: 15,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(20.0),
//                      ),
//                      child: Container(
//                        width: MediaQuery.of(context).size.width - 60,
//                        height: 150,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceAround,
//                          children: <Widget>[
//                            Image.asset(
//                              Cart_list[i]['loc'],
//                              fit: BoxFit.cover,
//                              width: MediaQuery.of(context).size.width / 3,
//                              height: MediaQuery.of(context).size.height / 7,
//                            ),
//                            Column(children: <Widget>[
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Text(
//                                  Cart_list[i]['id'],
//                                  style:
//                                      TextStyle(fontWeight: FontWeight.bold),
//                                ),
//                              ),
//                              Text(
//                                "Rate:" + '${Cart_list[i]['sum']}',
//                              ),
//                              Container(
//                                width: MediaQuery.of(context).size.width / 2 -
//                                    29,
//                                child: Row(
//                                  mainAxisAlignment:
//                                      MainAxisAlignment.spaceEvenly,
//                                  children: <Widget>[
//                                    IconButton(
//                                      onPressed: () {
//                                        setState(() {
//                                          if (Cart_list[i]['count'] > 1) {
//                                            count = Cart_list[i]['count'] - 1;
//                                            Cart_list[i]['count'] = count;
//                                          }
//                                        });
//                                      },
//                                      icon: Icon(Icons.remove),
//                                    ),
//                                    Text("${Cart_list[i]['count']}"),
//                                    IconButton(
//                                      onPressed: () {
//                                        setState(() {
//                                          {
//                                            print(Cart_list[i]['count'] + 1);
//                                            count = Cart_list[i]['count'] + 1;
//
//                                            Cart_list[i]['count'] = count;
//                                          }
//                                        });
//                                      },
//                                      icon: Icon(Icons.add),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              Text(
//                                "Total Rate" +
//                                    "\n${Cart_list[i]['count'] * Cart_list[i]['sum']}",
//                                textAlign: TextAlign.center,
//                                style: TextStyle(fontWeight: FontWeight.bold),
//                              ),
//                            ]),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
//                /*          if (Cart_list.length > 0)
//                  Positioned(
//                    top: 180.0 * Cart_list.length,
//
//                      child: Padding(
//                        padding: const EdgeInsets.only(top:20.0),
//                        child: Text("     Total Amount: " + "${gettotal()}",style: TextStyle(fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
//                      ),
//                    ),
//        */
//              ],
//            ),
//          ),*/
//          // if (Cart_list.length > 0)
//          //   Positioned(
//          //     top: 175.0 * Cart_list.length,
//          //     left: MediaQuery.of(context).size.width / 3,
//          //     child: Padding(
//          //       padding: const EdgeInsets.only(top: 20.0),
//          //       child: Text(
//          //         "     Total Amount: " + "${gettotal()}",
//          //         style: TextStyle(fontWeight: FontWeight.bold),
//          //         textAlign: TextAlign.center,
//          //       ),
//          //     ),
//          //   ),
//          // if (Cart_list.length > 0)
//          //   Positioned(
//          //     top: 175.0 * Cart_list.length + 40,
//          //     right: MediaQuery.of(context).size.width / 5,
//          //     child: RaisedButton(
//          //       shape: RoundedRectangleBorder(
//          //         borderRadius: BorderRadius.circular(18.0),
//          //       ),
//          //       child: Padding(
//          //         padding: const EdgeInsets.all(8.0),
//          //         child: Container(
//          //             child: Row(
//          //           children: <Widget>[
//          //             Text("     Payment     ",
//          //                 style: TextStyle(
//          //                   //fontWeight: FontWeight.bold,
//          //                   color: Colors.white,
//          //                   fontSize:
//          //                       MediaQuery.of(context).size.height * 0.026,
//          //                 )),
//          //             Icon(
//          //               Icons.arrow_forward,
//          //               color: Colors.white,
//          //             ),
//          //           ],
//          //         )),
//          //       ),
//          //       onPressed: () {
//          //         tot = gettotal();
//          //         Meals_list_ordered.add(
//          //           {
//          //             'id': 'Order ${Meals_list_ordered.length}',
//          //             'loc': 'images/pp.png',
//          //             'status': 'ordered',
//          //             'amount': gettotal(),
//          //             'mode': null,
//          //           },
//          //         );
//
//          //         Cart_list = [];
//
//          //         Navigator.push(
//          //             context,
//          //             MaterialPageRoute(
//          //                 builder: (context) => PaymentPage(tot)));
//          //       },
//          //       color: Color.fromRGBO(00, 44, 64, 1.0),
//          //     ),
//          //   ),
//          // if (Saloon_item.length > 0)
//          //   Positioned(
//          //     left: 60,
//          //     top: 180.0 * Cart_list.length + 100,
//          //     child: Card(
//          //       elevation: 10,
//          //       child: Container(
//          //         width: MediaQuery.of(context).size.width - 70,
//          //         child: Column(
//          //           children: <Widget>[
//          //             for (int i = 0; i < Saloon_item.length; i++)
//          //               ListTile(
//          //                 leading: Text(
//          //                   "${i + 1}",
//          //                   style: TextStyle(fontWeight: FontWeight.bold),
//          //                 ),
//          //                 title: Text(
//          //                   Saloon_item[i]['id'],
//          //                   style: TextStyle(fontWeight: FontWeight.bold),
//          //                 ),
//          //                 trailing: Container(
//          //                   width: MediaQuery.of(context).size.width / 3,
//          //                   child: Row(
//          //                     mainAxisAlignment: MainAxisAlignment.end,
//          //                     children: <Widget>[
//          //                       Text(
//          //                         '${Saloon_item[i]['price']}',
//          //                         style: TextStyle(fontWeight: FontWeight.bold),
//          //                       ),
//          //                       FlatButton(
//          //                         onPressed: () {
//          //                           setState(() {
//          //                             Saloon_item.removeWhere((element) =>
//          //                                 element['id'] ==
//          //                                 Saloon_item[i]['id']);
//          //                             saltot = 0;
//          //                             for (int j = 0;
//          //                                 j < Saloon_item.length;
//          //                                 j++)
//          //                               saltot += Saloon_item[j]['price'];
//          //                           });
//          //                         },
//          //                         child: Text(
//          //                           "Delete",
//          //                           style: TextStyle(
//          //                               color: Colors.red, fontSize: 10),
//          //                         ),
//          //                       ),
//          //                     ],
//          //                   ),
//          //                 ),
//          //               ),
//          //             if (Saloon_item.length > 0)
//          //               Column(
//          //                 children: <Widget>[
//          //                   Divider(),
//          //                   Row(
//          //                     mainAxisAlignment: MainAxisAlignment.center,
//          //                     children: <Widget>[
//          //                       Text(
//          //                         "Total Amount:  ",
//          //                         style: TextStyle(
//          //                           fontWeight: FontWeight.bold,
//          //                         ),
//          //                       ),
//          //                       Text(
//          //                         '$saltot',
//          //                         style: TextStyle(fontWeight: FontWeight.bold),
//          //                       ),
//          //                     ],
//          //                   ),
//          //                   if (Saloon_item.length > 0)
//          //                     Padding(
//          //                       padding: const EdgeInsets.only(top: 20.0),
//          //                       child: Container(
//          //                         width: MediaQuery.of(context).size.width,
//          //                         child: Row(
//          //                           mainAxisAlignment:
//          //                               MainAxisAlignment.spaceBetween,
//          //                           children: <Widget>[
//          //                             Padding(
//          //                               padding:
//          //                                   const EdgeInsets.only(left: 30.0),
//          //                               child: Text("Preferred Time",
//          //                                   style: TextStyle(
//          //                                       fontWeight: FontWeight.bold)),
//          //                             ),
//          //                             Container(
//          //                               width: 150,
//          //                               child: Row(
//          //                                 children: <Widget>[
//          //                                   Container(
//          //                                     width: 50,
//          //                                     height: 30,
//          //                                     decoration: BoxDecoration(
//          //                                       borderRadius:
//          //                                           BorderRadius.circular(15),
//          //                                       color: Color.fromRGBO(
//          //                                           00, 44, 64, 1),
//          //                                     ),
//          //                                     child: Padding(
//          //                                       padding: const EdgeInsets.only(
//          //                                           top: 10.0, left: 13),
//          //                                       child: TextFormField(
//          //                                         //obscureText: true,
//          //                                         keyboardType:
//          //                                             TextInputType.phone,
//          //                                         key: ValueKey('hour'),
//
//          //                                         style: TextStyle(
//          //                                             color: Colors.white,
//          //                                             fontWeight:
//          //                                                 FontWeight.bold),
//          //                                         textAlign: TextAlign.left,
//
//          //                                         decoration: InputDecoration(
//          //                                           hintStyle: TextStyle(
//          //                                             fontSize: 20.0,
//          //                                             color: Colors.red,
//          //                                           ),
//          //                                           border: InputBorder.none,
//          //                                         ),
//          //                                         validator: (value) {
//          //                                           if (value.isEmpty ||
//          //                                               int.parse(value) > 24) {
//          //                                             return ' Enter A Vaid Hour';
//          //                                           } else
//          //                                             return null;
//          //                                         },
//          //                                         onChanged: (value) {
//          //                                           hour = int.parse(value);
//          //                                         },
//          //                                         onSaved: (value) {
//          //                                           hour = int.parse(value);
//          //                                         },
//          //                                       ),
//          //                                     ),
//          //                                   ),
//          //                                   Padding(
//          //                                     padding:
//          //                                         const EdgeInsets.symmetric(
//          //                                             horizontal: 8.0),
//          //                                     child: Text(":",
//          //                                         style: TextStyle(
//          //                                             fontWeight:
//          //                                                 FontWeight.bold)),
//          //                                   ),
//          //                                   Container(
//          //                                     width: 50,
//          //                                     height: 30,
//          //                                     decoration: BoxDecoration(
//          //                                       borderRadius:
//          //                                           BorderRadius.circular(15),
//          //                                       color: Color.fromRGBO(
//          //                                           00, 44, 64, 1),
//          //                                     ),
//          //                                     child: Padding(
//          //                                       padding: const EdgeInsets.only(
//          //                                           top: 10.0, left: 13),
//          //                                       child: TextFormField(
//          //                                         //obscureText: true,
//          //                                         keyboardType:
//          //                                             TextInputType.phone,
//          //                                         key: ValueKey('minute'),
//
//          //                                         style: TextStyle(
//          //                                             color: Colors.white,
//          //                                             fontWeight:
//          //                                                 FontWeight.bold),
//          //                                         textAlign: TextAlign.left,
//
//          //                                         decoration: InputDecoration(
//          //                                           hintStyle: TextStyle(
//          //                                             fontSize: 20.0,
//          //                                             color: Colors.red,
//          //                                           ),
//          //                                           border: InputBorder.none,
//          //                                         ),
//          //                                         validator: (value) {
//          //                                           if (value.isEmpty ||
//          //                                               int.parse(value) > 60) {
//          //                                             return ' Enter A Vaid Minute';
//          //                                           } else
//          //                                             return null;
//          //                                         },
//          //                                         onChanged: (value) {
//          //                                           minute = int.parse(value);
//          //                                         },
//          //                                         onSaved: (value) {
//          //                                           minute = int.parse(value);
//          //                                         },
//          //                                       ),
//          //                                     ),
//          //                                   ),
//          //                                 ],
//          //                               ),
//          //                             ),
//          //                           ],
//          //                         ),
//          //                       ),
//          //                     ),
//          //                   if (Saloon_item.length > 0)
//          //                     Padding(
//          //                       padding: EdgeInsets.symmetric(
//          //                           vertical: 10, horizontal: 30),
//          //                       child: RaisedButton(
//          //                         onPressed: () {
//          //                           if (minute > 60 || hour > 25)
//          //                             Alert(
//          //                               context: context,
//          //                               type: AlertType.error,
//          //                               title: "Error",
//          //                               buttons: [
//          //                                 DialogButton(
//          //                                   child: Text(
//          //                                     "Hour or Minute Not in Bounds",
//          //                                     style: TextStyle(
//          //                                         color: Colors.black,
//          //                                         fontSize: 10),
//          //                                   ),
//          //                                   color: Colors.white,
//          //                                   onPressed: () async {
//          //                                     Navigator.pop(context);
//          //                                   },
//          //                                 )
//          //                               ],
//          //                             ).show();
//          //                           else {
//          //                             setState(() {
//          //                               for (int i = 0;
//          //                                   i < Saloon_item.length;
//          //                                   i++)
//          //                                 Appointment.add({
//          //                                   'id': Saloon_item[i]['id'],
//          //                                   'price': Saloon_item[i]['price'],
//          //                                   'hour': hour,
//          //                                   'minute': minute
//          //                                 });
//          //                               Saloon_item = [];
//          //                             });
//          //                           }
//          //                         },
//          //                         child: Text("Request Appointment",
//          //                             style: TextStyle(
//          //                               fontWeight: FontWeight.bold,
//          //                               color: Colors.white,
//          //                               fontSize:
//          //                                   MediaQuery.of(context).size.height *
//          //                                       0.02,
//          //                             )),
//          //                         shape: RoundedRectangleBorder(
//          //                             borderRadius: BorderRadius.circular(50.0),
//          //                             side: BorderSide(
//          //                               color: Color.fromRGBO(00, 44, 64, 1.0),
//          //                             )),
//          //                         color: Color.fromRGBO(00, 44, 64, 1.0),
//          //                       ),
//          //                     ),
//          //                 ],
//          //               )
//          //           ],
//          //         ),
//          //       ),
//          //     ),
//          //   ),
//          // if (Appointment.length > 0)
//          //   Positioned(
//          //     left: 60,
//          //     top: 180.0 * Cart_list.length + 100,
//          //     child: Card(
//          //       elevation: 10,
//          //       child: Container(
//          //           width: MediaQuery.of(context).size.width - 70,
//          //           child: Column(
//          //             children: <Widget>[
//          //               for (int i = 0; i < Appointment.length; i++)
//          //                 ListTile(
//          //                   leading: Text(
//          //                     "${i + 1}",
//          //                     style: TextStyle(fontWeight: FontWeight.bold),
//          //                   ),
//          //                   title: Text(
//          //                     Appointment[i]['id'],
//          //                     style: TextStyle(fontWeight: FontWeight.bold),
//          //                   ),
//          //                   trailing: Container(
//          //                     width: MediaQuery.of(context).size.width / 3,
//          //                     child: Row(
//          //                       mainAxisAlignment: MainAxisAlignment.end,
//          //                       children: <Widget>[
//          //                         Text(
//          //                           '${Appointment[i]['price']}',
//          //                           style:
//          //                               TextStyle(fontWeight: FontWeight.bold),
//          //                         ),
//          //                         FlatButton(
//          //                           onPressed: () {
//          //                             setState(() {
//          //                               Appointment.removeWhere((element) =>
//          //                                   element['id'] ==
//          //                                   Appointment[i]['id']);
//          //                               saltot = 0;
//          //                               for (int j = 0;
//          //                                   j < Appointment.length;
//          //                                   j++)
//          //                                 saltot += Appointment[j]['price'];
//          //                             });
//          //                           },
//          //                           child: Text(
//          //                             "Delete",
//          //                             style: TextStyle(
//          //                                 color: Colors.red, fontSize: 10),
//          //                           ),
//          //                         ),
//          //                       ],
//          //                     ),
//          //                   ),
//          //                 ),
//          //               if (Appointment.length > 0)
//          //                 Padding(
//          //                   padding:
//          //                       const EdgeInsets.symmetric(horizontal: 10.0),
//          //                   child: Divider(),
//          //                 ),
//          //               if (Appointment.length > 0)
//          //                 Text(
//          //                   "Preferred Time:   " +
//          //                       '${Appointment[0]['hour']}' +
//          //                       ":" +
//          //                       '${Appointment[0]['minute']}',
//          //                   style: TextStyle(fontWeight: FontWeight.bold),
//          //                   textAlign: TextAlign.center,
//          //                 ),
//          //               if (Appointment.length > 0)
//          //                 Padding(
//          //                   padding: EdgeInsets.symmetric(
//          //                       vertical: 10, horizontal: 30),
//          //                   child: Row(
//          //                     mainAxisAlignment: MainAxisAlignment.center,
//          //                     children: <Widget>[
//          //                       RaisedButton(
//          //                         onPressed: () {
//          //                           setState(() {
//          //                             Appointment = [];
//          //                           });
//          //                         },
//          //                         child: Text("Cancel",
//          //                             style: TextStyle(
//          //                               fontWeight: FontWeight.bold,
//          //                               color: Color.fromRGBO(00, 44, 64, 1.0),
//          //                               fontSize: 15,
//          //                             )),
//          //                         shape: RoundedRectangleBorder(
//          //                             borderRadius: BorderRadius.circular(50.0),
//          //                             side: BorderSide(
//          //                               color: Colors.grey,
//          //                             )),
//          //                         color: Colors.grey,
//          //                       ),
//          //                       RaisedButton(
//          //                         onPressed: () {
//          //                           Appointment = [];
//          //                           Navigator.push(
//          //                               context,
//          //                               MaterialPageRoute(
//          //                                   builder: (context) =>
//          //                                       PaymentPage(saltot)));
//          //                         },
//          //                         child: Text("Pay & Confirm",
//          //                             style: TextStyle(
//          //                               fontWeight: FontWeight.bold,
//          //                               color: Colors.white,
//          //                               fontSize: 15,
//          //                             )),
//          //                         shape: RoundedRectangleBorder(
//          //                             borderRadius: BorderRadius.circular(50.0),
//          //                             side: BorderSide(
//          //                               color: Color.fromRGBO(00, 44, 64, 1.0),
//          //                             )),
//          //                         color: Color.fromRGBO(00, 44, 64, 1.0),
//          //                       ),
//          //                     ],
//          //                   ),
//          //                 ),
//          //             ],
//          //           )),
//          //     ),
//          //   ),
//          CollapsingNavigationDrawer(false),
//          if(lastItem!=0)
//            Positioned(
//              top: 185.0 * Cart_list.length,
//              left: MediaQuery.of(context).size.width / 3,
//              child: Padding(
//                padding: const EdgeInsets.only(top: 20.0),
//                child: Text(
//                  "     Total Amount: " + "${total}",
//                  style: TextStyle(fontWeight: FontWeight.bold),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//            ),
//          if(lastItem != 0)
//          Positioned(
//              top: 185.0 * Cart_list.length  + 40,
//              right: MediaQuery.of(context).size.width / 5,
//              child: RaisedButton(
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(18.0),
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Container(
//                      child: Row(
//                        children: <Widget>[
//                          Text("     Payment     ",
//                              style: TextStyle(
//                                //fontWeight: FontWeight.bold,
//                                color: Colors.white,
//                                fontSize:
//                                MediaQuery.of(context).size.height * 0.026,
//                              )),
//                          Icon(
//                            Icons.arrow_forward,
//                            color: Colors.white,
//                          ),
//                        ],
//                      )),
//                ),
//                onPressed: () async {
//                  tot = await getTotal();
//                  Meals_list_ordered.add(
//                    {
//                      'id': 'Order ${Meals_list_ordered.length}',
//                      'loc': 'images/pp.png',
//                      'status': 'ordered',
//                      'amount': tot,
//                      'mode': null,
//                    },
//                  );
//
//                  Cart_list = [];
//
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => PaymentPage(tot)));
//                },
//                color: Color.fromRGBO(00, 44, 64, 1.0),
//              ),
//            ),
//
//          if (Saloon_item.length > 0)
//            Positioned(
//              left: 60,
//              top: 180.0 * Cart_list.length + 100,
//              child: Card(
//                elevation: 10,
//                child: Container(
//                  width: MediaQuery.of(context).size.width - 70,
//                  child: Column(
//                    children: <Widget>[
//                      for (int i = 0; i < Saloon_item.length; i++)
//                        ListTile(
//                          leading: Text(
//                            "${i + 1}",
//                            style: TextStyle(fontWeight: FontWeight.bold),
//                          ),
//                          title: Text(
//                            Saloon_item[i]['id'],
//                            style: TextStyle(fontWeight: FontWeight.bold),
//                          ),
//                          trailing: Container(
//                            width: MediaQuery.of(context).size.width / 3,
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.end,
//                              children: <Widget>[
//                                Text(
//                                  '${Saloon_item[i]['price']}',
//                                  style: TextStyle(fontWeight: FontWeight.bold),
//                                ),
//                                FlatButton(
//                                  onPressed: () {
//                                    setState(() {
//                                      Saloon_item.removeWhere((element) =>
//                                          element['id'] ==
//                                          Saloon_item[i]['id']);
//                                      saltot = 0;
//                                      for (int j = 0;
//                                          j < Saloon_item.length;
//                                          j++)
//                                        saltot += Saloon_item[j]['price'];
//                                    });
//                                  },
//                                  child: Text(
//                                    "Delete",
//                                    style: TextStyle(
//                                        color: Colors.red, fontSize: 10),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                      if (Saloon_item.length > 0)
//                        Column(
//                          children: <Widget>[
//                            Divider(),
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                Text(
//                                  "Total Amount:  ",
//                                  style: TextStyle(
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),
//                                Text(
//                                  '$total',
//                                  style: TextStyle(fontWeight: FontWeight.bold),
//                                ),
//                              ],
//                            ),
//                            if (Saloon_item.length > 0)
//                              Padding(
//                                padding: const EdgeInsets.only(top: 20.0),
//                                child: Container(
//                                  width: MediaQuery.of(context).size.width,
//                                  child: Row(
//                                    mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                    children: <Widget>[
//                                      Padding(
//                                        padding:
//                                            const EdgeInsets.only(left: 30.0),
//                                        child: Text("Preferred Time",
//                                            style: TextStyle(
//                                                fontWeight: FontWeight.bold)),
//                                      ),
//                                      Container(
//                                        width: 150,
//                                        child: Row(
//                                          children: <Widget>[
//                                            Container(
//                                              width: 50,
//                                              height: 30,
//                                              decoration: BoxDecoration(
//                                                borderRadius:
//                                                    BorderRadius.circular(15),
//                                                color: Color.fromRGBO(
//                                                    00, 44, 64, 1),
//                                              ),
//                                              child: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 10.0, left: 13),
//                                                child: TextFormField(
//                                                  //obscureText: true,
//                                                  keyboardType:
//                                                      TextInputType.phone,
//                                                  key: ValueKey('hour'),
//
//                                                  style: TextStyle(
//                                                      color: Colors.white,
//                                                      fontWeight:
//                                                          FontWeight.bold),
//                                                  textAlign: TextAlign.left,
//
//                                                  decoration: InputDecoration(
//                                                    hintStyle: TextStyle(
//                                                      fontSize: 20.0,
//                                                      color: Colors.red,
//                                                    ),
//                                                    border: InputBorder.none,
//                                                  ),
//                                                  validator: (value) {
//                                                    if (value.isEmpty ||
//                                                        int.parse(value) > 24) {
//                                                      return ' Enter A Vaid Hour';
//                                                    } else
//                                                      return null;
//                                                  },
//                                                  onChanged: (value) {
//                                                    hour = int.parse(value);
//                                                  },
//                                                  onSaved: (value) {
//                                                    hour = int.parse(value);
//                                                  },
//                                                ),
//                                              ),
//                                            ),
//                                            Padding(
//                                              padding:
//                                                  const EdgeInsets.symmetric(
//                                                      horizontal: 8.0),
//                                              child: Text(":",
//                                                  style: TextStyle(
//                                                      fontWeight:
//                                                          FontWeight.bold)),
//                                            ),
//                                            Container(
//                                              width: 50,
//                                              height: 30,
//                                              decoration: BoxDecoration(
//                                                borderRadius:
//                                                    BorderRadius.circular(15),
//                                                color: Color.fromRGBO(
//                                                    00, 44, 64, 1),
//                                              ),
//                                              child: Padding(
//                                                padding: const EdgeInsets.only(
//                                                    top: 10.0, left: 13),
//                                                child: TextFormField(
//                                                  //obscureText: true,
//                                                  keyboardType:
//                                                      TextInputType.phone,
//                                                  key: ValueKey('minute'),
//
//                                                  style: TextStyle(
//                                                      color: Colors.white,
//                                                      fontWeight:
//                                                          FontWeight.bold),
//                                                  textAlign: TextAlign.left,
//
//                                                  decoration: InputDecoration(
//                                                    hintStyle: TextStyle(
//                                                      fontSize: 20.0,
//                                                      color: Colors.red,
//                                                    ),
//                                                    border: InputBorder.none,
//                                                  ),
//                                                  validator: (value) {
//                                                    if (value.isEmpty ||
//                                                        int.parse(value) > 60) {
//                                                      return ' Enter A Vaid Minute';
//                                                    } else
//                                                      return null;
//                                                  },
//                                                  onChanged: (value) {
//                                                    minute = int.parse(value);
//                                                  },
//                                                  onSaved: (value) {
//                                                    minute = int.parse(value);
//                                                  },
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            if (Saloon_item.length > 0)
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: 10, horizontal: 30),
//                                child: RaisedButton(
//                                  onPressed: () {
//                                    if (minute > 60 || hour > 25)
//                                      Alert(
//                                        context: context,
//                                        type: AlertType.error,
//                                        title: "Error",
//                                        buttons: [
//                                          DialogButton(
//                                            child: Text(
//                                              "Hour or Minute Not in Bounds",
//                                              style: TextStyle(
//                                                  color: Colors.black,
//                                                  fontSize: 10),
//                                            ),
//                                            color: Colors.white,
//                                            onPressed: () async {
//                                              Navigator.pop(context);
//                                            },
//                                          )
//                                        ],
//                                      ).show();
//                                    else {
//                                      setState(() {
//                                        for (int i = 0;
//                                            i < Saloon_item.length;
//                                            i++)
//                                          Appointment.add({
//                                            'id': Saloon_item[i]['id'],
//                                            'price': Saloon_item[i]['price'],
//                                            'hour': hour,
//                                            'minute': minute
//                                          });
//                                        Saloon_item = [];
//                                      });
//                                    }
//                                  },
//                                  child: Text("Request Appointment",
//                                      style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        color: Colors.white,
//                                        fontSize:
//                                            MediaQuery.of(context).size.height *
//                                                0.02,
//                                      )),
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(50.0),
//                                      side: BorderSide(
//                                        color: Color.fromRGBO(00, 44, 64, 1.0),
//                                      )),
//                                  color: Color.fromRGBO(00, 44, 64, 1.0),
//                                ),
//                              ),
//                          ],
//                        )
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          if (Appointment.length > 0)
//            Positioned(
//              left: 60,
//              top: 180.0 * Cart_list.length + 100,
//              child: Card(
//                elevation: 10,
//                child: Container(
//                    width: MediaQuery.of(context).size.width - 70,
//                    child: Column(
//                      children: <Widget>[
//                        for (int i = 0; i < Appointment.length; i++)
//                          ListTile(
//                            leading: Text(
//                              "${i + 1}",
//                              style: TextStyle(fontWeight: FontWeight.bold),
//                            ),
//                            title: Text(
//                              Appointment[i]['id'],
//                              style: TextStyle(fontWeight: FontWeight.bold),
//                            ),
//                            trailing: Container(
//                              width: MediaQuery.of(context).size.width / 3,
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.end,
//                                children: <Widget>[
//                                  Text(
//                                    '${Appointment[i]['price']}',
//                                    style:
//                                        TextStyle(fontWeight: FontWeight.bold),
//                                  ),
//                                  FlatButton(
//                                    onPressed: () {
//                                      setState(() {
//                                        Appointment.removeWhere((element) =>
//                                            element['id'] ==
//                                            Appointment[i]['id']);
//                                        saltot = 0;
//                                        for (int j = 0;
//                                            j < Appointment.length;
//                                            j++)
//                                          saltot += Appointment[j]['price'];
//                                      });
//                                    },
//                                    child: Text(
//                                      "Delete",
//                                      style: TextStyle(
//                                          color: Colors.red, fontSize: 10),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                        if (Appointment.length > 0)
//                          Padding(
//                            padding:
//                                const EdgeInsets.symmetric(horizontal: 10.0),
//                            child: Divider(),
//                          ),
//                        if (Appointment.length > 0)
//                          Text(
//                            "Preferred Time:   " +
//                                '${Appointment[0]['hour']}' +
//                                ":" +
//                                '${Appointment[0]['minute']}',
//                            style: TextStyle(fontWeight: FontWeight.bold),
//                            textAlign: TextAlign.center,
//                          ),
//                        if (Appointment.length > 0)
//                          Padding(
//                            padding: EdgeInsets.symmetric(
//                                vertical: 10, horizontal: 30),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                RaisedButton(
//                                  onPressed: () {
//                                    setState(() {
//                                      Appointment = [];
//                                    });
//                                  },
//                                  child: Text("Cancel",
//                                      style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        color: Color.fromRGBO(00, 44, 64, 1.0),
//                                        fontSize: 15,
//                                      )),
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(50.0),
//                                      side: BorderSide(
//                                        color: Colors.grey,
//                                      )),
//                                  color: Colors.grey,
//                                ),
//                                RaisedButton(
//                                  onPressed: () {
//                                    Appointment = [];
//                                    Navigator.push(
//                                        context,
//                                        MaterialPageRoute(
//                                            builder: (context) =>
//                                                PaymentPage(saltot)));
//                                  },
//                                  child: Text("Pay & Confirm",
//                                      style: TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                        color: Colors.white,
//                                        fontSize: 15,
//                                      )),
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(50.0),
//                                      side: BorderSide(
//                                        color: Color.fromRGBO(00, 44, 64, 1.0),
//                                      )),
//                                  color: Color.fromRGBO(00, 44, 64, 1.0),
//                                ),
//                              ],
//                            ),
//                          ),
//                      ],
//                    )),
//              ),
//            ),
//
//        ],
//      ),
//    );

    print(Cart_list);
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
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                setState(() {
                  delete = true;
                  Cart_list = [];
                  Saloon_item = [];
                });
              },
              child: Text(
                "Clear Cart",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('user-activity').document(phoneNumber).collection("cart").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.data.documents.length > 0) {
              noItem = false;
          }
          print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
          print(snapshot.data.documents.length);
          print('-------------------------++++++++++++++++++++++++');
          return Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                      Image.asset(
                      'images/rtigger37.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                  ),
                ),
                CollapsingNavigationDrawer(false),
                ListView.builder(
                  //padding: EdgeInsets.only(bottom: 0,top),
                  scrollDirection: Axis.vertical,
                  itemExtent: 200,
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    itemNumber = snapshot.data.documents.length;
                    print(ds.documentID);
                    print('-------------------------++++++++++++++++++++++++');
                    print(itemNumber);
                    print(ds.data);
                    deleteCart() async {
                      await Firestore.instance.runTransaction((Transaction myTransaction) async {
                        await myTransaction.delete(ds.reference);
                        });
                      await Firestore.instance
                          .collection("user-activity")
                          .document(phoneNumber)
                          .collection("total")
                          .document("total")
                          .updateData({
                            'total' : 0.0,
                          });
                        setState(() {
                          noItem = true;
                        });
                      print("Deleted------------------------------------------------");
                    }


                    if(itemNumber > 0){
                        noItem = false;
                    }
                    if(delete == true){
                      deleteCart();
                      lastItem = 0;
                      print(lastItem);
                      print('-------------------------------------------deleted------------------------');
                      return Container();
                    }

                    return cartitem(
                        count : ds["count"],
                        img: ds["imgloc"],//'images/ii.png',
                        rate: double.parse(ds["rate"]),
                        id: ds["id"],
                        phoneNumber: phoneNumber,
                        onpress: () {},
                        index: index,
                      );
                  },
                ),
                StreamBuilder(
                  stream: Firestore.instance.collection('user-activity').document(phoneNumber).collection("total").snapshots(),
                  builder: (context, snapshot) {
                    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
                    print(snapshot.data.documents[0]["total"]);
                    grandTotal = snapshot.data.documents[0]["total"] ?? 0.0;
                    double calculatedTotal = 0.0;
                    for (int i = 0 ; i < Cart_list.length ; i++){
                      calculatedTotal = calculatedTotal + double.parse(Cart_list[i]['rate'])*Cart_list[i]['count'];
                    }
                    if(grandTotal != calculatedTotal){
                      Firestore.instance.collection('user-activity').document(phoneNumber).collection("total").document("total").updateData({'total' : calculatedTotal});
                      grandTotal = calculatedTotal;
                    }
                    return Positioned(
                      bottom: 20,
                      left: MediaQuery.of(context).size.width / 3 + 10,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          !noItem ? "     Total Amount: " + "$grandTotal" : "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                ),
                Positioned(
                  bottom: !noItem? 40 : MediaQuery.of(context).size.height - 200,
                  right: MediaQuery.of(context).size.width / 5 + 10,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  !noItem ? "     Payment     " : "   Go to Shop   ",
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize:
                                    MediaQuery.of(context).size.height * 0.026,
                                  )),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    ),
                    onPressed: ()  {
                      Meals_list_ordered.add(
                        {
                          'id': 'Order ${Meals_list_ordered.length}',
                          'loc': 'images/pp.png',
                          'status': 'ordered',
                          'amount': tot,
                          'mode': null,
                        },
                      );
                      !noItem ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPage(grandTotal)))
                          : Navigator.of(context).pop();
                    },
                    color: Color.fromRGBO(00, 44, 64, 1.0),
                  ),
                ),
                if (Saloon_item.length > 0)

                if (Appointment.length > 0)
                  Positioned(
                    left: 60,
                    top: 180.0 * Cart_list.length + 100,
                    child: Card(
                      elevation: 10,
                      child: Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: Column(
                            children: <Widget>[
                              for (int i = 0; i < Appointment.length; i++)
                                ListTile(
                                  leading: Text(
                                    "${i + 1}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  title: Text(
                                    Appointment[i]['id'],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          '${Appointment[i]['price']}',
                                          style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              Appointment.removeWhere((element) =>
                                              element['id'] ==
                                                  Appointment[i]['id']);
                                              saltot = 0;
                                              for (int j = 0;
                                              j < Appointment.length;
                                              j++)
                                                saltot += Appointment[j]['price'];
                                            });
                                          },
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                                color: Colors.red, fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (Appointment.length > 0)
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Divider(),
                                ),
                              if (Appointment.length > 0)
                                Text(
                                  "Preferred Time:   " +
                                      '${Appointment[0]['hour']}' +
                                      ":" +
                                      '${Appointment[0]['minute']}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              if (Appointment.length > 0)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RaisedButton(
                                        onPressed: () {
                                          setState(() {
                                            Appointment = [];
                                          });
                                        },
                                        child: Text("Cancel",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(00, 44, 64, 1.0),
                                              fontSize: 15,
                                            )),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                            side: BorderSide(
                                              color: Colors.grey,
                                            )),
                                        color: Colors.grey,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          Appointment = [];
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentPage(saltot)));
                                        },
                                        child: Text("Pay & Confirm",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15,
                                            )),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                            side: BorderSide(
                                              color: Color.fromRGBO(00, 44, 64, 1.0),
                                            )),
                                        color: Color.fromRGBO(00, 44, 64, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          )),
                    ),
                  ),
              ],
            ),
          );
        }
      ),
    );

  }
}



