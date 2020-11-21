import 'package:Resume/rg-localizations.dart';
import 'package:flutter/material.dart';

class RGShared {
  static final RGShared _instance = RGShared();
  static RGShared get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String emailValidator({
    @required BuildContext context,
    @required String email,
  }) {
    if (RegExp(r'.*@.*\..*').hasMatch(email)) {
      return null;
    }

    return RGLocalizations.of(context).signUpEmailError;
  }

  String passwordValidator({
    @required BuildContext context,
    @required String password,
  }) {
    if (password.length >= 8 &&
        password.length <= 16 &&
        RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$')
            .hasMatch(password)) {
      return null;
    }

    return RGLocalizations.of(context).signUpPasswordError;
  }
}
