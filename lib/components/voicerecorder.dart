import 'package:flutter/material.dart';

class VoiceRecorder extends StatefulWidget {
  const VoiceRecorder({Key key}) : super(key: key);

  @override
  _VoiceRecorderState createState() => _VoiceRecorderState();
}

class _VoiceRecorderState extends State<VoiceRecorder>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.15,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(LongPressEndDetails details) {
    _controller.reverse();
  }

  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: _onTapDown,
      onLongPressEnd: _onTapUp,
      onLongPress: () {},
      child: Transform.scale(
        scale: _scale,
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.28,
            width: size.height * 0.28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 45,
                    blurRadius: 4,
                    color: Colors.green[50],
                  ),
                  BoxShadow(
                    spreadRadius: 25,
                    blurRadius: 1,

                    color: Colors.green[100],
                    // color: Colors.amber[100].withOpacity(0.2),
                  ),
                ],
                color: Color(0xff9ad29c)),
            child: Image(
              image: AssetImage('assets/microphone.png'),
              height: size.height * 0.16,
            ),
          ),
        ),
      ),
    );
  }
}
