import 'package:flutter/material.dart';

class DiscussionsLanding extends StatefulWidget {
  const DiscussionsLanding({Key key}) : super(key: key);

  @override
  _DiscussionsLandingState createState() => _DiscussionsLandingState();
}

class _DiscussionsLandingState extends State<DiscussionsLanding> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text(
                "Click Here",
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.red[200],
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
              onPressed: () {},
            )
          ],
        ),
      ),
      // ignore: dead_code
    );
    return container;
  }
}
