import 'package:flutter/material.dart';
import 'package:hacktable/themeconfig.dart';

class RedAlertSent extends StatefulWidget {
  RedAlertSent({Key key}) : super(key: key);

  @override
  _RedAlertSentState createState() => _RedAlertSentState();
}

class _RedAlertSentState extends State<RedAlertSent> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Image.asset(
                "assets/redalertsent.jpg",
                height: size.height * 0.3,
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width * 0.75,
            child: Text(
              "Help is on the way!",
              style: TextStyle(fontSize: 24, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width * 0.75,
            child: Text(
              "Police and the emergency contacts have been alerted.\nWe are with you !",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
