import 'package:flutter/material.dart';
import 'package:hacktable/models/incident_analytics.dart';
import 'package:intl/intl.dart';

class IncidentCardWeb extends StatelessWidget {
  final IncidentAnalytics incident;
  final Function onTap;
  const IncidentCardWeb({Key key, this.onTap, this.incident}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      child: Card(
        child: ListTile(
          title: Text(incident.userName ?? "Anonymous"),
          subtitle: Text(
              DateFormat('kk:mm - dd-MM-yyyy').format(incident.reportedOn)),
          trailing: IconButton(
              onPressed: onTap, icon: Icon(Icons.arrow_forward_ios_rounded)),
          onTap: onTap,
        ),
      ),
    );
  }
}
