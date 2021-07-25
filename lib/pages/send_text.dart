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

  void _onTapSend() async {
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
        setState(() {
          _result = response.toString();
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
