import 'package:flutter/material.dart';
//import 'package:rtiggers/Profile/mobile%20number.dart';
import '../colors.dart';

import 'refactored_pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  getBody() {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: y,
          width: x,
          child: Image.asset(
            "assets/d.png",
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment(0, -.6),
          child: Column(
            children: [
              SizedBox(height: y * 0.013),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: y * 0.0108, horizontal: x * 0.0203),
                child: Container(
                  width: x * 0.3,
                  height: y * 0.1,
                  child: Image.asset('assets/ok.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Text(
                  'Welcome to Dello',
                  style: TextStyle(color: Colors.white, fontSize: y * 0.03),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0, 1),
          child: getList(),
        )
      ],
    );
  }

  getList() {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
      child: SizedBox(
        width: x,
        height: y / 1.47,
        child: ListView(
          children: [
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Shop Name',
              tileno: 1,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPage(process: 'Shop Name')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Owner Name',
              tileno: 2,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPage(process: 'Owner Name')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Mobile Number',
              tileno: 3,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditPage(process: 'Mobile Number')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Email id',
              tileno: 4,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPage(process: 'E-mail ID')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'List of Products',
              tileno: 5,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditPage(process: 'List of Products')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Cancelled Cheque',
              tileno: 6,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditPage(process: 'Cancelled Cheque')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Bank Details',
              tileno: 7,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditPage(process: 'Bank Details')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Business Details',
              tileno: 8,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditPage(process: 'Business Details')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Signature',
              tileno: 9,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPage(process: 'Signature')));
              },
            ),
            Divider(thickness: 0.5),
            profilelistbutton(
              height: y,
              width: x,
              label: 'Address',
              tileno: 10,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPage(process: 'Address')));
              },
            ),
            Divider(thickness: 0.5),
          ],
        ),
      ),
    );
  }
}

class profilelistbutton extends StatelessWidget {
  const profilelistbutton(
      {@required this.height,
      @required this.width,
      @required this.label,
      @required this.tileno,
      this.onPress});

  final double height;
  final double width;
  final String label;
  final int tileno;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: ListTile(
        // leading: Image.asset("assets/$tileno.png",height: height*0.06,width: width*0.09,),
        title: Text(label),
        trailing: Image.asset("assets/b.png",
            height: height * 0.04, width: width * 0.07),
      ),
    );
  }
}
