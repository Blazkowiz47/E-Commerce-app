import 'package:flutter/material.dart';

List items = [
  'Name',
  "Mobile Number",
  "E-Mail Id",
  "Settings",
  "Rate Us",
  "Share your Friends",
  "Privacy Policy",
  "Notificatons",
  "Contact Us"
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/d.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 50,
            top: 30,
            child: Image.asset(
              'images/c.png',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 100,
              top: 130,
              child: Text(
                "Welcome to Rtiggers",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Positioned(
              left: MediaQuery.of(context).size.width / 2 - 40,
              top: 160,
              child: RaisedButton(
                onPressed: () {},
                child: Text("Login"),
                color: Colors.amber,
              )),
          for (int i = 0; i < items.length; i++)
            Positioned(

              top: 240+ 60.0*i,
              left: 10,
              right: 10,
              child: Column(
                children: <Widget>[
                                    Divider(),

                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(
                        'images/${i + 1}.png',
                        fit: BoxFit.cover,
                        color: i == 0 ? null : Color.fromRGBO(00, 44, 64, 1),
                        width: 100,
                        height: 100,
                      ),
                      backgroundColor:
                          i == 0 ? Color.fromRGBO(00, 44, 64, 1) : Colors.white,
                    ),
                    title: Text(
                      items[i],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.chevron_right),
                        color: Colors.grey,
                        onPressed: () {}),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
