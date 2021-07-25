import 'package:flutter/material.dart';
import 'package:hacktable/pages/map_feature/incidents_section.dart';
import 'package:hacktable/pages/map_feature/map_page_web.dart';

class IncidentsMapLanding extends StatefulWidget {
  IncidentsMapLanding({Key key}) : super(key: key);

  @override
  _IncidentsMapLandingState createState() => _IncidentsMapLandingState();
}

class _IncidentsMapLandingState extends State<IncidentsMapLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: IncidentsSectionWeb(),
          ),
          Expanded(
            flex: 3,
            child: MapPageWeb(),
            // child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
