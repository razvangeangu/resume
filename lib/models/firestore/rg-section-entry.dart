import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class RGSectionEntry {
  final String name;
  final DateTime fromDate;
  final DateTime toDate;
  final String description;
  final String title;

  RGSectionEntry({
    @required this.name,
    @required this.fromDate,
    this.toDate,
    @required this.description,
    @required this.title,
  });

  String interval() {
    return '${DateFormat('yMMMM').format(fromDate)} - ${DateFormat('yMMMM').format(toDate)}';
  }
}
