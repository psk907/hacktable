import 'package:flutter/material.dart';

Future asyncConfirmDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'False Alarm',
          style: TextStyle(fontSize: 28),
        ),
        content: const Text(
          'Are you sure you want to STOP the countdown?',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text('YES'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
        ],
      );
    },
  );
}
