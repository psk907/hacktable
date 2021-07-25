import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacktable/services/api.dart';

import '../servicelocator.dart';

class TextForm extends StatefulWidget {
  const TextForm({Key key}) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: textController,
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: _onTapSend,
          child: _isLoading ? CircularProgressIndicator() : Text("Let's go"),
        ),
        SizedBox(
          height: 30,
        ),
        Text(_result.toString()),
      ],
    );
  }
}
