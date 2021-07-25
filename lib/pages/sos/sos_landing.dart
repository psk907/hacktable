import 'package:flutter/material.dart';
import 'package:hacktable/components/alertbutton.dart';
import 'package:hacktable/pages/sos/countdown.dart';
import 'package:hacktable/pages/sos/yellowAlertsent.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:hacktable/utils/router.dart';

class SOSLandingPage extends StatefulWidget {
  SOSLandingPage({Key key}) : super(key: key);

  @override
  _SOSLandingPageState createState() => _SOSLandingPageState();
}

class _SOSLandingPageState extends State<SOSLandingPage> {
  bool showFirstContainer = true;
  CountDownController controller = CountDownController();
  int duration = 10;
  int caseNo = 0;
  //default case
  // caseNo = 1 for yellow alert
  // caseNo = 2 for red alert

  onLongPress(no) => {
        setState(() {
          showFirstContainer = !showFirstContainer;
          caseNo = no;
        }),
      };

  void callback() {
    setState(() {
      showFirstContainer = !showFirstContainer;
    });
  }

  afterAlertSent() {
    // if (caseNo == 1)
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => YellowAlertSent()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSwitcher(
          duration: Duration(milliseconds: 1000),
          child: showFirstContainer
              ? Column(
                  key: UniqueKey(),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(flex: 2),
                    Text(
                      "Stay calm, We are with you",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(flex: 3),
                    Animatedbutton(
                        onLongPress: () => onLongPress(1),
                        text: "TAP AND HOLD FOR \n YELLOW ALERT",
                        buttonColor: Palette.brightyellow,
                        shadowColor: Palette.paleyellow,
                        secondaryshadowColor: Color(0xfffff0c1)),
                    Spacer(flex: 6),
                    Animatedbutton(
                        onLongPress: () => onLongPress(2),
                        text: "TAP AND HOLD FOR \n RED ALERT",
                        buttonColor: Colors.red[200],
                        shadowColor: Colors.red[100],
                        secondaryshadowColor: Colors.red[50]),
                    Spacer(flex: 5),
                    ElevatedButton.icon(
                      label: Text(
                        'Force send',
                        style: TextStyle(fontSize: 22),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal[400],
                        onPrimary: Colors.white,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      icon: Icon(Icons.next_plan),
                      onPressed: () {
                        print('Pressed');
                        // CustomRoute(page: YellowAlertSent());

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YellowAlertSent()),
                        );
                      },
                    )
                  ],
                )
              : CountdownWidget(
                  controller: controller,
                  duration: duration,
                  caseNo: caseNo,
                  callback: callback,
                  afterAlertSent: afterAlertSent,
                )),
    );
  }
}
