import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hacktable/pages/discussions/confirmation.dart';
import 'package:hacktable/services/api.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

import '../servicelocator.dart';

class VoiceRecorder extends StatefulWidget {
  const VoiceRecorder({Key key}) : super(key: key);

  @override
  _VoiceRecorderState createState() => _VoiceRecorderState();
}

class _VoiceRecorderState extends State<VoiceRecorder>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  final _audioRecorder = Record();
  bool _isLoading = false;
  dynamic _result = '';
  String filePath = '';

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

  Future<List<String>> _fetchTopics(String conversationId) async {
    Response<dynamic> response;
    List<String> topics = [];
    List<double> sentimentValues = [];
    double sentiment = 0;
    try {
      response = await ServiceLocator<Api>().GET(
          'https://api.symbl.ai/v1/conversations/${conversationId}/topics?sentiment=true');
      if (response == null) {
        print('null response from fetchTopics!');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        var parsedJson = json.decode(response.toString());
        for (var x in parsedJson['topics']) {
          topics.add(x['text']);
          if (x['sentiment']['suggested'] == 'negative') {
            sentimentValues.add(x['sentiment']['polarity']['score']);
          }
        }
        if (sentimentValues.isNotEmpty) {
          for (var x in sentimentValues) {
            sentiment += x;
          }
          sentiment /= sentimentValues.length;
          topics.add(sentiment.toString());
        }
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Confirmation(topics: topics, sentimentIntensity: sentiment)),
        );
      } else {
        print("fetchTopics() returned: " + response.statusCode.toString());
      }
    } catch (e) {
      print("fetchTopics() returned: " + e.toString());
    }

    return topics;
  }

  void _onTapSend() async {
    ///Fetches conversation ID

    print('here!');

    setState(() {
      _isLoading = true;
    });

    Response<dynamic> response;
    List<String> topics = [];
    try {
      response = await ServiceLocator<Api>().POSTAudio(filePath);
      if (response == null) {
        print('null response!');
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        var parsedJson = json.decode(response.toString());
        topics = await _fetchTopics(parsedJson['conversationId']);
        setState(() {
          _result = topics.toString();
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future asyncConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Recording succesful',
            style: TextStyle(fontSize: 28),
          ),
          content: const Text(
            'Are you ready to send?',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              child: const Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('YES'),
              onPressed: () {
                _onTapSend();
                //HERE
              },
            )
          ],
        );
      },
    );
  }

  void _onLongPressStart(LongPressStartDetails details) async {
    _controller.forward();
    bool result = await _audioRecorder.hasPermission();
    if (result) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      filePath = appDocPath;
      print(appDocPath);
      await _audioRecorder.start(
        path: '${appDocPath}/myFile.mpeg', // required
        encoder: AudioEncoder.AAC, // by default
        bitRate: 128000, // by default
      );
    }
  }

  void _onLongPressEnd(LongPressEndDetails details) async {
    bool isRecording = await _audioRecorder.isRecording();
    if (isRecording) {
      await _audioRecorder.stop();
    }

    asyncConfirmDialog(context);
    _controller.reverse();
  }

  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    var size = MediaQuery.of(context).size;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GestureDetector(
            onLongPressEnd: _onLongPressEnd,
            onLongPressStart: _onLongPressStart,
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
