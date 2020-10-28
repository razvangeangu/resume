import 'package:flutter/material.dart';
import 'package:flutterstarter/rg-localizations.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          RGLocalizations.of(context).appName,
        ),
      ),
    );
  }
}
