import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume/components/rg-button.dart';
import 'package:resume/components/rg-input.dart';
import 'package:resume/rg-localizations.dart';
import 'package:resume/services/authentication.dart';
import 'package:resume/utils/rg-constants.dart';
import 'package:resume/utils/rg-routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _onLogIn() async {
    if (_formKey.currentState.validate()) {
      try {
        await Authentication.instance.signInWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );

        await Navigator.pushNamed(context, RGRoutes.home);
      } catch (error) {
        if (error is PlatformException) {
          print(error?.message); // TODO: Display on screen Error
        }
      }
    }
  }

  Widget _buildSignUpPrompt() {
    return Text.rich(
      TextSpan(
        text: RGLocalizations.of(context).loginNoAccount,
        children: [
          TextSpan(
            text: RGLocalizations.of(context).loginSignUp,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.bodyText2.color,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, RGRoutes.signup);
              },
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPassword() {
    return FlatButton(
      child: Text(
        RGLocalizations.of(context).loginForgotPassword,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, RGRoutes.forgotPassword);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        dismissKeyboard(context);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: kVerticalPadding * 3.0,
            left: kHorizontalPadding,
            right: kHorizontalPadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: kVerticalPadding),
                  child: RGInput(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    placeholder:
                        RGLocalizations.of(context).loginEmailPlaceholder,
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: kVerticalPadding),
                  child: RGInput(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    placeholder:
                        RGLocalizations.of(context).loginPasswordPlaceholder,
                    prefixIcon: Icon(Icons.fingerprint),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: kVerticalPadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: RGButton(
                          label: RGLocalizations.of(context).loginSignIn,
                          onPressed: _onLogIn,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildSignUpPrompt(),
                _buildForgotPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
