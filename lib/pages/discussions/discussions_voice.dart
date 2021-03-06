import 'package:flutter/material.dart';
import 'package:hacktable/components/voicerecorder.dart';
import 'package:hacktable/pages/discussions/discussions_text.dart';

import 'package:hacktable/utils/router.dart';

import '../../themeconfig.dart';

class DiscussionsVoice extends StatefulWidget {
  const DiscussionsVoice({Key key}) : super(key: key);

  @override
  _DiscussionsVoiceState createState() => _DiscussionsVoiceState();
}

class _DiscussionsVoiceState extends State<DiscussionsVoice> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.AppBarBackground,
          title: Text('Voice Up'),
          elevation: 5.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline_rounded,
                color: Colors.white,
              ),
              // onPressed: () => Navigator.pushNamed(context, PROFILE_PAGE),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VoiceRecorder(),
            Text(
              "Narrate your experience",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Text(
              "Tap and hold on the mic to record",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Container(
              width: size.width * 0.35,
              height: size.height * 0.07,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SendText(),
                      ),
                    );
                  },
                  child: Text("Write instead")),
            ),
          ],
        ));
  }
}
