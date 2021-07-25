import 'package:flutter/material.dart';
import 'package:hacktable/components/incident_card_web.dart';
import 'package:hacktable/themeconfig.dart';

class IncidentsSectionWeb extends StatefulWidget {
  IncidentsSectionWeb({Key key}) : super(key: key);

  @override
  _IncidentsSectionWebState createState() => _IncidentsSectionWebState();
}

class _IncidentsSectionWebState extends State<IncidentsSectionWeb> {
  bool _isOpen = false;
  void _onTap() {
    setState(() {
      _isOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.lighter,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Incidents",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Person name",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Blah blah Blah",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Report: ",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Lots and lots of text",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isOpen = false;
                                });
                              },
                              icon: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return IncidentCardWeb(
                          onTap: _onTap,
                        );
                      },
                      itemCount: 15,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
