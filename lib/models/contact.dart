import 'dart:convert';

import 'package:flutter/foundation.dart';

enum ContactType { yellow, red }

class Contact {
  final ContactType type;
  final String name;
  final String contactNo;
  Contact({
    @required this.type,
    @required this.name,
    @required this.contactNo,
  });

  Contact copyWith({
    ContactType type,
    String name,
    String contactNo,
  }) {
    return Contact(
      type: type ?? this.type,
      name: name ?? this.name,
      contactNo: contactNo ?? this.contactNo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type == ContactType.red ? "R" : "Y",
      'name': name,
      'contactNo': contactNo,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      type: map['type'] == "R" ? ContactType.red : ContactType.yellow,
      name: map['name'],
      contactNo: map['contactNo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source));

  @override
  String toString() =>
      'Contact(type: $type, name: $name, contactNo: $contactNo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact &&
        other.type == type &&
        other.name == name &&
        other.contactNo == contactNo;
  }

  @override
  int get hashCode => type.hashCode ^ name.hashCode ^ contactNo.hashCode;
}
