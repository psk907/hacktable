import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Data class for a single incident
///
/// Follows the below format
/// ```
/// {
///  "userUuid": "",
/// "incidentUuid": "",
///  "userName": "",
///  "location": [0.123157, 12.546786548],
///  "incidentSummary": "",
///  "conversationId": "",
///  "reportedOn": "2021-25-07 01:47:47"
/// }
/// ```
class Incident {
  final String userUuid;
  final String incidentUuid;
  final String userName;
  final List<double> location;
  final String incidentSummary;
  final String conversationId;
  final DateTime reportedOn;
  Incident({
    @required this.userUuid,
    @required this.incidentUuid,
    @required this.userName,
    @required this.location,
    @required this.incidentSummary,
    @required this.conversationId,
    @required this.reportedOn,
  });

  Incident copyWith({
    String userUuid,
    String incidentUuid,
    String userName,
    List<double> location,
    String incidentSummary,
    String conversationId,
    DateTime reportedOn,
  }) {
    return Incident(
      userUuid: userUuid ?? this.userUuid,
      incidentUuid: incidentUuid ?? this.incidentUuid,
      userName: userName ?? this.userName,
      location: location ?? this.location,
      incidentSummary: incidentSummary ?? this.incidentSummary,
      conversationId: conversationId ?? this.conversationId,
      reportedOn: reportedOn ?? this.reportedOn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userUuid': userUuid,
      'incidentUuid': incidentUuid,
      'userName': userName,
      'location': location,
      'incidentSummary': incidentSummary,
      'conversationId': conversationId,
      'reportedOn': reportedOn.toString(),
    };
  }

  factory Incident.fromMap(Map<String, dynamic> map) {
    return Incident(
      userUuid: map['userUuid'],
      incidentUuid: map['incidentUuid'],
      userName: map['userName'],
      location: List<double>.from(map['location']),
      incidentSummary: map['incidentSummary'],
      conversationId: map['conversationId'],
      reportedOn: DateTime.tryParse(map['reportedOn']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Incident.fromJson(String source) =>
      Incident.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Incident(userUuid: $userUuid, incidentUuid: $incidentUuid, userName: $userName, location: $location, incidentSummary: $incidentSummary, conversationId: $conversationId, reportedOn: $reportedOn)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Incident &&
        other.userUuid == userUuid &&
        other.incidentUuid == incidentUuid &&
        other.userName == userName &&
        listEquals(other.location, location) &&
        other.incidentSummary == incidentSummary &&
        other.conversationId == conversationId &&
        other.reportedOn == reportedOn;
  }

  @override
  int get hashCode {
    return userUuid.hashCode ^
        incidentUuid.hashCode ^
        userName.hashCode ^
        location.hashCode ^
        incidentSummary.hashCode ^
        conversationId.hashCode ^
        reportedOn.hashCode;
  }
}
