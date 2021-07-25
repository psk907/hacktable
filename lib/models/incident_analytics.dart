import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Data class for a single incident, with analytics
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
///  "topics": ["", "", ""],
///  "sentimentInensity": -0.7,
/// }
/// ```

class IncidentAnalytics {
  final String userUuid;
  final String incidentUuid;
  final String userName;
  final List<double> location;
  final String incidentSummary;
  final String conversationId;
  final DateTime reportedOn;
  final List<String> topics;
  final double sentimentIntensity;

  IncidentAnalytics({
    @required this.userUuid,
    @required this.incidentUuid,
    @required this.userName,
    @required this.location,
    @required this.incidentSummary,
    @required this.conversationId,
    @required this.reportedOn,
    @required this.topics,
    @required this.sentimentIntensity,
  });

  IncidentAnalytics copyWith({
    String userUuid,
    String incidentUuid,
    String userName,
    List<double> location,
    String incidentSummary,
    String conversationId,
    DateTime reportedOn,
    List<String> topics,
    double sentimentIntensity,
  }) {
    return IncidentAnalytics(
      userUuid: userUuid ?? this.userUuid,
      incidentUuid: incidentUuid ?? this.incidentUuid,
      userName: userName ?? this.userName,
      location: location ?? this.location,
      incidentSummary: incidentSummary ?? this.incidentSummary,
      conversationId: conversationId ?? this.conversationId,
      reportedOn: reportedOn ?? this.reportedOn,
      topics: topics ?? this.topics,
      sentimentIntensity: sentimentIntensity ?? this.sentimentIntensity,
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
      'topics': topics,
      'sentimentIntensity': sentimentIntensity,
    };
  }

  factory IncidentAnalytics.fromMap(Map<String, dynamic> map) {
    return IncidentAnalytics(
      userUuid: map['userUuid'],
      incidentUuid: map['incidentUuid'],
      userName: map['userName'],
      location: List<double>.from(map['location']),
      incidentSummary: map['incidentSummary'],
      conversationId: map['conversationId'],
      reportedOn: DateTime.tryParse(map['reportedOn']),
      topics: map['topics'],
      sentimentIntensity: map['sentimentIntensity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IncidentAnalytics.fromJson(String source) =>
      IncidentAnalytics.fromMap(json.decode(source));

  @override
  String toString() {
    return 'IncidentAnalytics(userUuid: $userUuid, incidentUuid: $incidentUuid, userName: $userName, location: $location, incidentSummary: $incidentSummary, conversationId: $conversationId, reportedOn: $reportedOn, topics: ${topics.toString()}, sentimentIntensity: $sentimentIntensity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IncidentAnalytics &&
        other.userUuid == userUuid &&
        other.incidentUuid == incidentUuid &&
        other.userName == userName &&
        listEquals(other.location, location) &&
        other.incidentSummary == incidentSummary &&
        other.conversationId == conversationId &&
        other.reportedOn == reportedOn &&
        other.topics == topics &&
        other.sentimentIntensity == sentimentIntensity;
  }

  @override
  int get hashCode {
    return userUuid.hashCode ^
        incidentUuid.hashCode ^
        userName.hashCode ^
        location.hashCode ^
        incidentSummary.hashCode ^
        conversationId.hashCode ^
        reportedOn.hashCode ^
        topics.hashCode ^
        sentimentIntensity.hashCode;
  }
}
