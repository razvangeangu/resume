import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resume/components/rg-button.dart';
import 'package:resume/components/rg-input.dart';
import 'package:resume/utils/rg-routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _buildSignUpPrompt() {
    return Text.rich(
      TextSpan(
        text: " You don't have an account? ",
        children: [
          TextSpan(
            text: 'Sign Up!',
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
      child: Text('Forgot your password?'),
      onPressed: () {
        Navigator.pushNamed(context, RGRoutes.forgotPassword);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RGInput(),
          RGInput(),
          RGButton(label: 'Sign In'),
          _buildSignUpPrompt(),
          _buildForgotPassword(),
        ],
      ),
    );
  }
}
