import 'package:flutter/material.dart';

class RGSection {
  final String name;
  final DateTime fromDate;
  final DateTime toDate;
  final String description;
  final String title;

  RGSection({
    this.name,
    this.fromDate,
    this.toDate,
    this.description,
    this.title,
  });

  String period() {
    String formatedFrom;
    String formatedTo;

    if (fromDate.month < 10) {
      formatedFrom =
          '0' + fromDate.month.toString() + ' / ' + fromDate.year.toString();
    } else {
      formatedFrom =
          fromDate.month.toString() + ' / ' + fromDate.year.toString();
    }

    if (toDate.month < 10) {
      formatedTo =
          '0' + toDate.month.toString() + ' / ' + toDate.year.toString();
    } else {
      formatedTo = toDate.month.toString() + ' / ' + toDate.year.toString();
    }

    return formatedFrom + ' - ' + formatedTo;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
