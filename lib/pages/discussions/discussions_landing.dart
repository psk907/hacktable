import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacktable/themeconfig.dart';

class DiscussionsLanding extends StatefulWidget {
  const DiscussionsLanding({Key key}) : super(key: key);

  @override
  _DiscussionsLandingState createState() => _DiscussionsLandingState();
}

class _DiscussionsLandingState extends State<DiscussionsLanding> {
  Text get container => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            // add Column
           mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              RaisedButton(
                onPressed: ()=> {},
                color: Palette.AppBarBackground,
                padding: EdgeInsets.only(right: 10.0, bottom: 1.0, top: 1.0),
                child: Text(
                  'Go Now',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.brightyellow,
                      fontSize: 15.0
                  ), //TextStyle
                ), //Text
              ),
              Text(
                  'Let us know if something disturbing took place, we will use this information to make the place safer.',
                  style: TextStyle(
                      // your text
                      fontSize: 20.0,
                      color: Colors.black)),
 //FlatButton
            ],
          ),
        ),
      ),
    );
    return container;
  }
}
