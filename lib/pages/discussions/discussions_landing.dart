import 'dart:html';

import 'package:flutter/material.dart';
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
<<<<<<< HEAD
    return Scaffold (

    body : Container(
      decoration: BoxDecoration(

            color: Colors.white,
      ),
      child: Center(
        child: Column( // add Column
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome', style: TextStyle( // your text
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)
            ),
            RaisedButton(onPressed: () {},
              color: Palette.AppBarBackground,
              child: Text('Go now')
      ),
      ],
    ),
    ),
    ),
=======
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            // add Column
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Let us know if something disturbing took place, we will use this information to make the place safer.',
                  style: TextStyle(
                      // your text
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              RaisedButton(
                onPressed: () {},
                child: Text('Go now'),
              ), // your button beneath text
            ],
          ),
        ),
      ),
>>>>>>> 4712f677e152fa4e40a0db190577dfdb41cfd2e4
    );
    return container;
  }
}
