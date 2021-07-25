import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacktable/themeconfig.dart';

class Confirmation extends StatefulWidget {
  final List<String> topics;
  final double sentimentIntensity;

  const Confirmation(
      {Key key, @required this.topics, @required this.sentimentIntensity})
      : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(16),
      height: height,
      color: Palette.lighter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Thank you for voicing up!',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "You're playing a part in making this world a safer place, by helping us collect invaluable data.\nAnd don't worry, as promised, you'll remain anonymous.",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[100]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Report',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Keywords detected', style: TextStyle(fontSize: 18)),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.topics.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(6),
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            color: Palette.paleyellow),
                        child: Text(widget.topics[index]),
                      );
                    },
                  ),
                ),
                Text(
                    'Incident severity:  ' +
                        widget.sentimentIntensity.toString(),
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Back home',
                    style: TextStyle(color: Palette.paleyellow, fontSize: 18),
                  )))
        ],
      ),
    );
  }
}
