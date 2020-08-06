import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';
import 'package:social_share/social_share.dart';


class Share extends StatefulWidget {
  @override
  _Share createState() => _Share();
}

class _Share extends State<Share> {


  final key = GlobalKey<ScaffoldState>();

  String _platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        title: Text("Share App"),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: getContents(),
    );
  }

  getContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/14.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png",height: 75,width: 75,),
          ],
        ),
        SizedBox(height: 20,),


        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.shareWhatsapp('This is the link to my app - ').then((value) => print(value));
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: brownColor,
          child: Text("Share to WhatsApp",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(10.0),),

        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.shareTelegram('This is the link to my app - ');
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: brownColor,
          child: Text("Share to Telegram",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(10.0),),

        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.shareTwitter('This is the link to my app - \n', url: '<Link will go down here>', trailingText: '\nDownload and enjoy');
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: brownColor,
          child: Text("Share to Twitter",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(10.0),),

        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.shareSms("This is the link to my app -",
                url: "\n<Link Will Go Here>",
                trailingText: "\nDownload and enjoy")
                .then((data) {
              print(data);
            });
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: brownColor,
          child: Text("Share as SMS",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(10.0),),

        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.copyToClipboard('This the link to my app -').whenComplete(() => key.currentState.showSnackBar(SnackBar(content: Text('Copied to clipboard'), duration: Duration(seconds: 3),)));
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: brownColor,
          child: Text("Copy to Clipboard",style: TextStyle(color: Colors.white)),

        ),

      ],
    );
  }




}




