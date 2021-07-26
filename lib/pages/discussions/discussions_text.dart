import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacktable/pages/discussions/confirmation.dart';
import 'package:hacktable/services/api.dart';
import 'package:hacktable/utils/router.dart';

import '../../servicelocator.dart';
import '../../themeconfig.dart';

class SendText extends StatefulWidget {
  const SendText({Key key}) : super(key: key);

  @override
  _SendTextState createState() => _SendTextState();
}

class _SendTextState extends State<SendText> {
  bool _isLoading = false;
  dynamic _result = '';
  TextEditingController textController = new TextEditingController();

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

    print(textController.text);
    if (textController.text.isEmpty) {
      print('Empty message!');
      return;
    }

    Response<dynamic> response;
    List<String> topics = [];
    try {
      response = await ServiceLocator<Api>().POST(Api.sendText, {
        "messages": [
          {
            "payload": {
              "content": textController.text,
              "contentType": "text/plain"
            }
          }
        ]
      });
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
            icon: Icon(Icons.face_rounded),
            onPressed: () => Navigator.pushNamed(context, PROFILE_PAGE),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.01),

              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "Tell us what happened",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Form(
                child: TextField(
                  controller: textController,
                  autocorrect: true,
                  maxLines: 5,
                  style: TextStyle(fontSize: 22, color: Colors.black),
                  cursorHeight: 32,
                  decoration: InputDecoration(
                    hintText: ' Start typing here ...',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.amber[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.018),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: size.width * 0.25,
                    height: size.height * 0.05,
                    child: TextButton(
                      onPressed: () {
                        textController.clear();
                      },
                      child: Text("Clear"),
                    ),
                  ),
                  Container(
                    width: size.width * 0.25,
                    height: size.height * 0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal[400],
                        // padding:
                        // EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // <-- Radius
                        ),
                        // textStyle: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      onPressed: _onTapSend,
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : Text("Sumbit"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  "What happens with my data?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: size.height * 0.02),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Your input is valuable to us\nThe data that you provide us with will be shared to the authorities. It will be an anonymous submission. We use Symbl.ai to gain more insights on the data provided.",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[600]),
                  textAlign: TextAlign.justify,
                ),
              ),

              // TODO: IDK WHAT TO DO WITH THE LINE BELOW
              Text(_result.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
