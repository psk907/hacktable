import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:hacktable/components/falsealert.dart';
import 'package:hacktable/themeconfig.dart';

class CountdownWidget extends StatefulWidget {
  // const CountdownWidget({Key key}) : super(key: key);
  final int duration;
  final CountDownController controller;
  final String title = "";
  final int caseNo;
  final Function callback;

  CountdownWidget({this.controller, this.duration, this.caseNo, this.callback});
  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color outColor, inColor, fontColor;
    if (widget.caseNo == 1) {
      outColor = Palette.brightyellow;
      inColor = Palette.paleyellow;
      fontColor = Colors.grey[700];
    } else if (widget.caseNo == 2) {
      outColor = Palette.darker;
      inColor = Palette.lightredtry;
      fontColor = Colors.white;
    }

    return Stack(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
            alignment: Alignment(0, -0.85),
            child: Text(
              "SOS Message will be sent",
              style: TextStyle(fontSize: 25),
            )),
        Align(
            alignment: Alignment(0, -0.65),
            child: Text(
              "Double tap to stop countdown",
              style: TextStyle(fontSize: 27),
            )),
        Align(
          alignment: Alignment(0, -0.1),
          child: GestureDetector(
            onDoubleTap: () async {
              widget.controller.pause();
              final bool action = await asyncConfirmDialog(context);
              if (!action)
                widget.controller.resume();
              else
                widget.callback();
            },
            child: CircularCountDownTimer(
              duration: widget.duration,
              initialDuration: 0,
              controller: widget.controller,
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
              ringColor: Colors.grey[300],
              ringGradient: null,
              fillColor: outColor,
              fillGradient: null,
              backgroundColor: inColor,
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                  fontSize: 60, color: fontColor, fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: true,
              onStart: () {
                // Here, do whatever you want
                print('Countdown Started');
              },

              // This Callback will execute when the Countdown Ends.
              onComplete: () {
                // Here, do whatever you want
                print('Countdown Ended');
              },
            ),
          ),
        ),
        Align(
            alignment: Alignment(0, 0.7),
            child: ElevatedButton.icon(
              label: Text(
                'Force send',
                style: TextStyle(fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width * 0.65, size.height * 0.075),
                primary: Colors.teal[400],
                onPrimary: Colors.white,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              icon: Icon(Icons.next_plan),
              onPressed: () {
                print('Pressed');
              },
            ))
      ],
    );
  }
}
