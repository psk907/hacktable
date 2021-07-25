import 'package:flutter/material.dart';
import 'package:hacktable/pages/sos/redAlertsent.dart';
import 'package:hacktable/services/sos_service.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:lottie/lottie.dart';

class YellowAlertSent extends StatefulWidget {
  const YellowAlertSent({Key key}) : super(key: key);

  @override
  _YellowAlertSentState createState() => _YellowAlertSentState();
}

class _YellowAlertSentState extends State<YellowAlertSent> {
  bool _isSOSSent = false;
  @override
  void initState() {
    super.initState();
    SosService.sendYellowAlert().then((value) {
      if (value)
        setState(() {
          _isSOSSent = true;
        });
    });
  }

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
            height: size.height * 0.29,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child: (_isSOSSent)
                    ? Lottie.asset('assets/greenticklottie.json',
                        width: size.width * 0.2)
                    : Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: CircularProgressIndicator(
                          color: Palette.brightyellow,
                        ),
                      ),
              ),
              Container(
                width: size.width * 0.6,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: (_isSOSSent)
                      ? Text(
                          "Your contacts have been alerted",
                          style: TextStyle(fontSize: 28, height: 1),
                        )
                      : Text(
                          "Alerting your emergency contacts",
                          style: TextStyle(fontSize: 25, height: 1),
                        ),
                ),
              )
            ],
          ),
          // Spacer(flex: 2),
          Container(
            width: size.width * 0.75,
            child: Text(
              "Hope everything is under control",
              style:
                  TextStyle(fontSize: 22, color: Colors.grey[700], height: 1.4),
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
              "Do you want to send a red alert instead?",
              style: TextStyle(fontSize: 24, height: 1.2),
            ),
          ),
          Container(
            width: size.width * 0.775,
            height: size.height * 0.085,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Palette.darker,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
            width: size.width * 0.77,
            child: Text(
              "*Pressing this button will immediately call the police and send your live location status\nUSE ONLY IN CASE OF EMERGENCY",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      )),
    );
  }
}
