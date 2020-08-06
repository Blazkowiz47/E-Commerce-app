import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'tansactiondone.dart';

class CodPage extends StatefulWidget {
  double total;
  CodPage(this.total);
  @override
  _CodPageState createState() => _CodPageState();
}

class _CodPageState extends State<CodPage> {
  var textController = new TextEditingController();

  bool loading = false;
  void gotocomptrans() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DonePage(7)));
  }

  void submit() async {
    setState(() {
      loading = true;
    });

    await Firestore.instance.collection('orders_cod').add({
      'name': name,
      'address': address,
      'pincode': pincode,
      'landmark': landmark,
      'mobile phone number': phone,
      'alternate number': alternate,
      'total': widget.total,
    });

    setState(() {
      loading = false;
    });
    gotocomptrans();
  }

  String name = "";
  String address = "";
  String pincode = "";
  String landmark = "";
  String phone = "";
  String alternate = "";
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y  = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color.fromRGBO(00, 44, 64, 1.0),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Cash On Delivery",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: new Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding:
                     EdgeInsets.only(left: x*0.08,right: x*0.08, top: y*0.02,),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: x*0.1),
                    child: new TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                          hintStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: x*0.08,right: x*0.08, top: y*0.05,),
                child: Container(
                  height: 90,
                  decoration: new BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: x*0.1),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (value) {
                        address = value;
                      },
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Address',
                          hintStyle: TextStyle(color: Colors.black),
                          suffix: Padding(
                            padding: EdgeInsets.only(right: x*0.04),

                            child:InkWell(
                            child: Text("Add Live Location",style: TextStyle(color:Colors.indigo,fontWeight:FontWeight.w400,fontSize: 14),),
                            onTap: () async {
                              try {
                                Position position = await Geolocator()
                                    .getCurrentPosition(
                                        desiredAccuracy:
                                            LocationAccuracy.bestForNavigation);
                                final coordinates = new Coordinates(
                                    position.latitude, position.longitude);
                                var addresses = await Geocoder.local
                                    .findAddressesFromCoordinates(coordinates);
                                var first = addresses.first;
                                print(
                                    "${first.featureName} : ${first.addressLine}");
                                setState(() {
                                  address = first.addressLine;
                                });
                              } catch (e) {
                                print('error');
                                print(e);
                              }
                            },
                          ),),
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: x*0.08,right: x*0.08, top: y*0.05,),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Padding(
    padding:  EdgeInsets.only(left: x*0.1),
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Pincode',
                          labelStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) {
                        pincode = value;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: x*0.08,right: x*0.08, top: y*0.05,),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Padding(
    padding:  EdgeInsets.only(left: x*0.1),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Landmark',
                          hintStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) {
                        landmark = value;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: x*0.08,right: x*0.08, top: y*0.05,),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Padding(
    padding:  EdgeInsets.only(left: x*0.1),
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) {
                        phone = value;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: x*0.08,right: x*0.08, top: y*0.05,),
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Padding(
    padding:  EdgeInsets.only(left: x*0.1),
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      maxLines: null,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Alter Mobile Number',
                          hintStyle: TextStyle(color: Colors.black)),
                      onChanged: (value) {
                        alternate = value;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: y*0.1,horizontal: x*0.2),
                child: RaisedButton(
                  onPressed: () {
                    if (name.isNotEmpty &&
                        address.isNotEmpty &&
                        pincode.isNotEmpty &&
                        landmark.isNotEmpty &&
                        phone.isNotEmpty &&
                        alternate.isNotEmpty) submit();
                  },
                  child: Container(
                    height: x*0.12,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: y*0.01,
                        ),
                        loading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            : Text("Save",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(
                        color: Color.fromRGBO(00, 44, 64, 1.0),
                      )),
                  color: Color.fromRGBO(00, 44, 64, 1.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
