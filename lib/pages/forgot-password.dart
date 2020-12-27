import 'package:flutter/material.dart';
import 'package:resume/components/rg-button.dart';
import 'package:resume/components/rg-input.dart';
import 'package:resume/rg-localizations.dart';
import 'package:resume/utils/rg-constants.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                      label: RGLocalizations.of(context).forgotPasswordRecover,
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
