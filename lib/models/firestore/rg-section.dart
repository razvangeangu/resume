import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:resume/models/firestore/rg-section-entry.dart';

class RGSection {
  String uid;
  String name;
  List<RGSectionEntry> entries;

  RGSection({
    @required this.name,
    @required this.entries,
  });

  static RGSection fromSnapshot(DocumentSnapshot snapshot) {
    // ignore: missing_required_param
    final section = RGSection();
    if (snapshot == null) return section;

    final data = snapshot.data();
    section.uid = snapshot.id;
    section.name = data['name'];
    section.entries =
        (data['entries'] ?? []).map((entry) => RGSectionEntry.fromJson(entry));

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
