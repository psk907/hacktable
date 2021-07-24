import 'package:flutter/material.dart';

class Animatedbutton extends StatefulWidget {
  final double height;
  final double width;
  final Function onLongPress;
  final Color buttonColor;
  final Color shadowColor;
  final Color secondaryshadowColor;
  final String text;
  // final Offset offset;
  // final Duration duration;
  // final BorderRadius borderRadius;

  Animatedbutton(
      {@required this.text,
      @required this.buttonColor,
      @required this.shadowColor,
      @required this.secondaryshadowColor,
      this.onLongPress,
      this.width = 185,
      this.height = 185});
  @override
  _AnimatedbuttonState createState() => _AnimatedbuttonState();
}

class _AnimatedbuttonState extends State<Animatedbutton>
    with SingleTickerProviderStateMixin {
  Color shadowcolor;
  Color secshadowcolor;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    shadowcolor = widget.shadowColor;
    secshadowcolor = widget.secondaryshadowColor;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 180),
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

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  Widget get _animatedButtonUI {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        boxShadow: [
          BoxShadow(
            spreadRadius: 35,
            color: secshadowcolor,
          ),
          BoxShadow(
            spreadRadius: 15,
            color: shadowcolor,
            // color: Colors.amber[100].withOpacity(0.2),
          ),
        ],
        color: widget.buttonColor,
      ),
      child: Center(
          child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onLongPress: widget.onLongPress,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }
}
