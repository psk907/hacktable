import 'package:flutter/material.dart';
import 'package:hacktable/pages/sos/redAlertsent.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:lottie/lottie.dart';

class YellowAlertSent extends StatefulWidget {
  const YellowAlertSent({Key key}) : super(key: key);

  @override
  _YellowAlertSentState createState() => _YellowAlertSentState();
}

class _YellowAlertSentState extends State<YellowAlertSent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.AppBarBackground,
        title: Text('Voice Up'),
        elevation: 5.0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/alerted.jpg",
            height: size.height * 0.3,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset('assets/greenticklottie.json',
                  width: size.width * 0.2),
              Container(
                width: size.width * 0.6,
                child: Text(
                  "Your contacts have been alerted",
                  style: TextStyle(fontSize: 30, height: 1),
                ),
              )
            ],
          ),
          // Spacer(flex: 2),
          Container(
            width: size.width * 0.75,
            child: Text(
              "Hope everything is under control",
              style: TextStyle(fontSize: 24, color: Colors.grey[700]),
            ),
          ),
          Divider(
            thickness: 3,
            endIndent: size.width * 0.18,
            indent: size.width * 0.18,
          ),
          Container(
            width: size.width * 0.75,
            child: Text(
              "Do you want to send a red alert?",
              style: TextStyle(fontSize: 28),
            ),
          ),
          Container(
            width: size.width * 0.8,
            height: size.height * 0.1,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Palette.darker,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // TODO: RED ALERT
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => RedAlertSent(),
                    ),
                  );
                },
                child: Text("RED ALERT")),
          ),
          Container(
            width: size.width * 0.8,
            child: Text(
              "*Pressing this button will immediately call the police and send your live location status\nUSE ONLY IN CASE OF EMERGENCY",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      )),
    );
  }
}
