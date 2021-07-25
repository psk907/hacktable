import 'package:flutter/material.dart';
import 'package:hacktable/components/incident_card_web.dart';
import 'package:hacktable/models/incident_analytics.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:intl/intl.dart';

class IncidentsSectionWeb extends StatelessWidget {
  final List<IncidentAnalytics> incidents;
  final int selectedIndex;
  final Function(int) onSelect;
  final Function onUnselect;
  IncidentsSectionWeb(
      {Key key,
      @required this.incidents,
      @required this.selectedIndex,
      this.onSelect,
      this.onUnselect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isOpen = selectedIndex >= 0;
    return Container(
      color: Palette.lighter,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      color: Colors.white),
                ),
                alignment: Alignment.centerLeft,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.asset('assets/logo.png', height: 50),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Incidents reported",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.white),
            ),
            alignment: Alignment.centerLeft,
          ),
          Flexible(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: (_isOpen)
                  ? Card(
                      key: ValueKey("specificIncident"),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF8E5E5),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      "Report by: ",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      incidents[selectedIndex].userName,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Location: ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      incidents[selectedIndex]
                                              .location
                                              .first
                                              .toString() +
                                          "," +
                                          incidents[selectedIndex]
                                              .location
                                              .last
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Reported at: ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      DateFormat("kk:mm on DD-mm-yy").format(
                                          incidents[selectedIndex].reportedOn),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Details: ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  incidents[selectedIndex].incidentSummary ??
                                      "No decsription given",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: Colors.grey[100]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'AI Insights',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('Keywords detected',
                                          style: TextStyle(fontSize: 16)),
                                      Container(
                                        height: 50,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: incidents[selectedIndex]
                                                  ?.topics
                                                  ?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Chip(
                                                backgroundColor:
                                                    Palette.paleyellow,
                                                label: Text(
                                                    incidents[selectedIndex]
                                                        .topics[index]),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Text(
                                          'Incident severity:  ' +
                                              incidents[selectedIndex]
                                                  .sentimentIntensity
                                                  .toString(),
                                          style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              onPressed: onUnselect,
                              icon: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return IncidentCardWeb(
                          incident: incidents[index],
                          onTap: () => onSelect(index),
                        );
                      },
                      itemCount: incidents.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
