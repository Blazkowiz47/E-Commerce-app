

import 'package:flutter/material.dart';

import 'package:rtiggers/Profile/edit_email.dart';
import 'package:rtiggers/Profile/edit_name.dart';
import 'package:rtiggers/Profile/edit_phone_number.dart';
import 'package:rtiggers/Profile/notifications.dart';
import 'package:rtiggers/Profile/privacy_policy.dart';
import 'package:rtiggers/Profile/rate_us.dart';
import 'package:rtiggers/Profile/settings.dart';
import 'package:rtiggers/Profile/share.dart';

import '../colors.dart';
import 'contact_us.dart';


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
          child: Image.asset("assets/d.png",fit: BoxFit.fill,),
        ),
        Align(
          alignment: Alignment(0,-.6),
          
          child: Column(
            children: [
              SizedBox(height:  y * 0.013),
              Padding(
                padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
                child: Container(
                  width: x*0.3,
                  height: y*0.1,
                  child: Image.asset('assets/ok.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Text('Welcome to Rtiggers', style: TextStyle(color: Colors.white, fontSize: y*0.03),),
              ),
               Padding(
                 padding: EdgeInsets.symmetric(vertical: y * 0.003, horizontal: x * 0.005),
                 child: MaterialButton(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(6)
                   ),
                   color: brownColor,
                   child: Text("Login",style: TextStyle(color: Colors.white),),
                   onPressed: (){
                     // AuthService().signOut();
                   },

                 ),
               ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0,1),
          child: getList(),
        )
      ],
    );
  }

  getList() {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
      child: SizedBox(
        width: x,
        height: y/1.47,
        child: ListView(
          children: [
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Name',tileno: 1,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditName()));
            }, ),
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Mobile Number',tileno: 2,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditPhoneNumber()));
            }, ),
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Email id',tileno: 3,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditEmail()));
            }, ),
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Settings',tileno: 4,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            }, ),
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Rate Us',tileno: 5,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RateUs()));
            }, ),
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Share your friends',tileno: 6,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Share()));
            }, ),
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Privacy Policy',tileno: 7,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            }, ),
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Notifications',tileno: 8,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
            }, ),
            Divider(thickness: 0.5),
            profilelistbutton(height: y, width: x,label: 'Contact Us',tileno: 9,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
            }, ),
            Divider(thickness: 0.5),
          ],
        ),
      ),
    );
  }
}

class profilelistbutton extends StatelessWidget {
  const profilelistbutton({ @required this.height, @required this.width,@required this.label,@required this.tileno,@required this.onPress});

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
        leading: Image.asset("assets/$tileno.png",height: height*0.06,width: width*0.2,),
        title: Text(label),
        trailing: Image.asset("assets/b.png",height: height*0.04,width: width*0.07),
      ),
    );
  }
}
