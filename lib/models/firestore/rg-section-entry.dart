import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class RGSectionEntry {
  String name;
  DateTime fromDate;
  DateTime toDate;
  String description;
  String title;

  RGSectionEntry({
    @required this.name,
    @required this.fromDate,
    this.toDate,
    @required this.description,
    @required this.title,
  });

  String get interval {
    return '${DateFormat.yMMMM().format(fromDate)} - ${DateFormat.yMMMM().format(toDate)}';
  }

  static RGSectionEntry fromSnapshot(DocumentSnapshot snapshot) {
    // ignore: missing_required_param
    final section = RGSectionEntry();
    if (snapshot == null) return section;

    final data = snapshot.data();
    section.name = data['name'];

    try {
      section.fromDate = DateTime.parse(data['fromDate']);
    } catch (_) {}

    try {
      section.toDate = DateTime.parse(data['toDate']);
    } catch (_) {}

    section.description = data['description'];
    section.title = data['title'];

    return section;
  }

  static RGSectionEntry fromJson(Map<String, dynamic> map) {
    // ignore: missing_required_param
    final section = RGSectionEntry();
    if (map == null) return section;

    section.name = map['name'];
    try {
      section.fromDate = DateTime.parse(map['fromDate']);
    } catch (_) {}

    try {
      section.toDate = DateTime.parse(map['toDate']);
    } catch (_) {}

    section.description = map['description'];
    section.title = map['title'];

    return section;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
