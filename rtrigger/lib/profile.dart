import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/contact.dart';
import 'package:rtrigger/reset.dart';
import 'package:share/share.dart';
import './edit_details.dart';
import 'Authentication/login_signup.dart';
import './chat_screen.dart';
import './main_tabs.dart';
import './main.dart';
import './policy.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Color _color = Color.fromRGBO(0, 44, 64, 1);

  Widget tiles(String name, Icon icon, var tap) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Container(
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: Colors.grey[200])),
        ),
        child: ListTile(
          leading: Padding(
            child: icon,
            padding: EdgeInsets.only(left: x * 0.05),
          ),
          trailing: Padding(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
              padding: EdgeInsets.only(right: x * 0.03)),
          onTap: () {
            if (name == 'Name')
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Edit(user, 0)));
            else if (name == 'E-Mail Id')
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Edit(mail, 2)));
            else if (name == 'Share your friends')
              tap();
            else if (name == 'Notification')
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ChatScreen()));
            else if (name == 'Contact Us')
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Contact()));
            else if (name == 'Privacy Policy')
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Privacy()));
            else if (name == 'Settings')
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Reset()));
          },
          title: Padding(
            child: Text(name,
                style: TextStyle(
                    color: _color, fontWeight: FontWeight.bold, fontSize: 18)),
            padding: EdgeInsets.only(left: x * 0.04),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    void share() {
      final RenderBox box = context.findRenderObject();
      Share.share(
        'check out the product',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    }

    return Scaffold(
      /*appBar: AppBar(
        leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
             currentSelectedIndex=6;
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Homepage()));
            }),
        backgroundColor: Color.fromRGBO(00, 44, 64, 1.0),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Profile",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),*/
      body: SingleChildScrollView(
        child: Container(
          height: y,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/d.png'), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                    child: Image.asset(
                  'images/c.png',
                  height: y * 0.1,
                )),
              ),
              SizedBox(
                height: y * 0.016,
              ),
              Text(
                'Welcome to Rtiggers',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: y * 0.02),
              ),
              SizedBox(
                height: y * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: y * 0.04,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(173, 173, 117, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: y*0.018,
                      ),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Home()));
                    },
                  ),
                ),
              ),
              Container(height: y * 0.07),
              tiles(
                  'Name',
                  Icon(
                    Icons.person,
                    color: _color,
                  ),
                  null),
              tiles(
                  'Mobile Number',
                  Icon(
                    Icons.phone,
                    color: _color,
                  ),
                  null),
              tiles(
                  'E-Mail Id',
                  Icon(
                    Icons.email,
                    color: _color,
                  ),
                  null),
              tiles(
                  'Settings',
                  Icon(
                    Icons.settings,
                    color: _color,
                  ),
                  null),
              tiles(
                  'Rate us',
                  Icon(
                    Icons.star,
                    color: _color,
                  ),
                  null),
              tiles(
                  'Share your friends',
                  Icon(
                    Icons.share,
                    color: _color,
                  ),
                  share),
              tiles(
                  'Privacy Policy',
                  Icon(
                    Icons.security,
                    color: _color,
                  ),
                  null),
              tiles(
                  'Notification',
                  Icon(
                    Icons.notifications,
                    color: _color,
                  ),
                  null),
              tiles(
                  'Contact Us',
                  Icon(
                    Icons.contacts,
                    color: _color,
                  ),
                  null),
            ],
          ),
        ),
      ),
    );
  }
}
