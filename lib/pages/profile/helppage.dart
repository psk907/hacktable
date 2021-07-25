import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themeconfig.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.AppBarBackground,
        title: Text(
          "Help",
          style: GoogleFonts.muktaTextTheme()
              .headline1
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        height: height * 0.85,
        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            helpcard(
                height,
                Colors.amber[100],
                Colors.grey[600],
                "Yellow Alert",
                "You can use this alert when you aren't sure if there is danger around , but you want to alert your emergency contacts about your whereabouts"),
            helpcard(height, Palette.lightredtry, Colors.grey[800], "Red Alert",
                "Use this alert ONLY incase of real emergencies. It will trigger the police and all your emergency contacts."),
          ],
        ),
      ),
    );
  }

  Container helpcard(double height, Color color, Color fontcolor,
      String alerttext, String alertdescription) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
      height: height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            alerttext,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(alertdescription,
              style: TextStyle(fontSize: 18, color: fontcolor)),
        ],
      ),
    );
  }
}
