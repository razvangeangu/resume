import 'package:flutter/material.dart';
import 'package:resume/components/rg-button.dart';
import 'package:resume/components/rg-input.dart';
import 'package:resume/rg-localizations.dart';
import 'package:resume/utils/rg-constants.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: kVerticalPadding * 3.0,
          left: kHorizontalPadding,
          right: kHorizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kVerticalPadding),
              child: RGInput(
                placeholder: RGLocalizations.of(context).loginEmailPlaceholder,
                prefixIcon: Icon(Icons.email),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kVerticalPadding),
              child: RGInput(
                placeholder:
                    RGLocalizations.of(context).loginPasswordPlaceholder,
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kVerticalPadding),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).maybePop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: RGButton(
                      label: RGLocalizations.of(context).loginSignIn,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
