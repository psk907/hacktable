import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:lottie/lottie.dart';

class DiscussionsLanding extends StatefulWidget {
  const DiscussionsLanding({Key key}) : super(key: key);

  @override
  _DiscussionsLandingState createState() => _DiscussionsLandingState();
}

class _DiscussionsLandingState extends State<DiscussionsLanding> {
  Text get container => null;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            // add Column
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/discussions.json',
                  width: size.width * 0.35, height: size.height * 0.25),

              Center(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Text(
                          'Let us know if something disturbing took place, we will use this information to make the place safer.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // your text

                              fontSize: 23.0,
                              height: 1,
                              color: Colors.black)))),
              ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    primary: Palette.AppBarBackground,
                    padding: EdgeInsets.only(
                        right: 18.0, bottom: 2.0, top: 2.0, left: 15.0)),
                child: Text(
                  'Go Now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 23.0), //TextStyle
                ), //Text
              ),

              //FlatButton
            ],
          ),
        ),
      ),
    );
    return container;
  }
}
