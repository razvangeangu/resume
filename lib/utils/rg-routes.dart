import 'package:resume/pages/forgot-password.dart';
import 'package:resume/pages/home.dart';
import 'package:resume/pages/login.dart';
import 'package:resume/pages/root.dart';
import 'package:resume/pages/signup.dart';

class RGRoutes {
  static const String root = '/';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';

  static final routes = {
    RGRoutes.root: (context) => RootPage(),
    RGRoutes.signup: (context) => SignupPage(),
    RGRoutes.forgotPassword: (context) => ForgotPasswordPage(),
    RGRoutes.login: (context) => LoginPage(),
    RGRoutes.home: (context) => HomePage(),
  };
}
