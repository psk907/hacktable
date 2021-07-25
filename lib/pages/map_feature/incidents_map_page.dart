import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacktable/models/incident_analytics.dart';
import 'package:hacktable/models/incidents_example.dart';
import 'package:hacktable/pages/map_feature/incidents_section.dart';
import 'package:hacktable/pages/map_feature/map_page_web.dart';

class IncidentsMapLanding extends StatefulWidget {
  IncidentsMapLanding({Key key}) : super(key: key);

  @override
  _IncidentsMapLandingState createState() => _IncidentsMapLandingState();
}

class _IncidentsMapLandingState extends State<IncidentsMapLanding> {
  List<IncidentAnalytics> incidents;
  int _selectedIndex = -1;
  bool isLoading = true;
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    incidents = incidentsExample
        .map<IncidentAnalytics>((e) => IncidentAnalytics.fromMap(e))
        .toList();
    print(incidents);
    setState(() {
      isLoading = false;
    });
  }

  void _selectIncident(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _unSelectIncident() {
    setState(() {
      _selectedIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              children: [
                Expanded(
                  child: IncidentsSectionWeb(
                    onSelect: _selectIncident,
                    onUnselect: _unSelectIncident,
                    incidents: incidents,
                    selectedIndex: _selectedIndex,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: MapPageWeb(
                    incident:
                        _selectedIndex >= 0 ? incidents[_selectedIndex] : null,
                    incidents: incidents,
                  ),
                  // child: Placeholder(),
                ),
              ],
            ),
    );
  }
}
