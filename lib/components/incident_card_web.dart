import 'package:flutter/material.dart';

class IncidentCardWeb extends StatelessWidget {
  final Function onTap;
  const IncidentCardWeb({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      child: Card(
        child: ListTile(
          title: Text("Person A"),
          trailing: IconButton(
              onPressed: onTap, icon: Icon(Icons.arrow_forward_ios_rounded)),
          onTap: onTap,
        ),
      ),
    );
  }
}
