import 'package:flutter/material.dart';

const kDefaultLocaleName = 'en';
const kHorizontalPadding = 20.0;
const kVerticalPadding = 16.0;

void dismissKeyboard(BuildContext context) {
  final currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}
