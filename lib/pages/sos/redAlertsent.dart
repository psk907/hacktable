import 'package:flutter/material.dart';
import 'package:hacktable/services/sos_service.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:lottie/lottie.dart';

class RedAlertSent extends StatefulWidget {
  RedAlertSent({Key key}) : super(key: key);

  @override
  _RedAlertSentState createState() => _RedAlertSentState();
}

class _RedAlertSentState extends State<RedAlertSent> {
  bool _isSOSSent = false;

  @override
  void initState() {
    super.initState();
    SosService.sendRedAlert().then((value) {
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
                          color: Palette.dribble,
                        ),
                      ),
              ),
              Container(
                width: size.width * 0.6,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: (_isSOSSent)
                      ? Text(
                          "Help is on the way!",
                          style: TextStyle(fontSize: 28, height: 1),
                        )
                      : Text(
                          "Alerting your emergency contacts and informing the authoritites",
                          style: TextStyle(
                              fontSize: 20, height: 1, color: Colors.grey[700]),
                        ),
                ),
              )
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: (_isSOSSent)
                ? Container(
                    alignment: Alignment.center,
                    width: size.width * 0.75,
                    child: Text(
                      "The police and your emergency contacts have been alerted.\nWe are with you !",
                      style: TextStyle(fontSize: 32, height: 1.3),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    width: size.width * 0.75,
                    child: Text(
                      "Hang in there...",
                      style: TextStyle(
                          fontSize: 20, height: 1, color: Colors.grey[900]),
                    ),
                  ),
          ),
        ],
      )),
    );
  }
}
