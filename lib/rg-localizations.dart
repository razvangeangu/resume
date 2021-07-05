// https://flutter.dev/docs/development/accessibility-and-localization/internationalization#dart-tools

// flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/bn-localizations.dart
// flutter pub run intl_translation:generate_from_arb \
// --output-dir=lib/l10n --no-use-deferred-loading \
// lib/bn-localizations.dart lib/l10n/intl_*.arb

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume/l10n/messages_all.dart';
import 'package:resume/utils/rg-constants.dart';

class RGLocalizations {
  RGLocalizations(this.localeName);

  static Future<RGLocalizations> load(Locale locale) {
    final name = locale.countryCode != null && locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return RGLocalizations(localeName);
    });
  }

  static RGLocalizations of(BuildContext context) {
    return Localizations.of<RGLocalizations>(context, RGLocalizations);
  }

  final String localeName;

  // #region "Globals"

  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      locale: localeName,
    );
  }

  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      locale: localeName,
    );
  }

  String get appName {
    return Intl.message(
      'Resume',
      name: 'appName',
      locale: localeName,
    );
  }

  // #endregion "Globals"

  // #region "ForgotPassword"

  String get forgotPasswordRecover {
    return Intl.message(
      'Recover my password',
      name: 'forgotPasswordRecover',
      locale: localeName,
    );
  }

  // #endregion "ForgotPassword"

  // #region "Login"

  String get loginEmailPlaceholder {
    return Intl.message(
      'Email',
      name: 'Email',
      locale: localeName,
    );
  }

  String get loginPasswordPlaceholder {
    return Intl.message(
      'Password',
      name: 'Password',
      locale: localeName,
    );
  }

  String get loginSignIn {
    return Intl.message(
      'Sign In',
      name: 'Sign In',
      locale: localeName,
    );
  }

  String get loginForgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'loginForgotPassword',
      locale: localeName,
    );
  }

  String get loginSignUp {
    return Intl.message(
      'Sign Up!',
      name: 'loginSignUp',
      locale: localeName,
    );
  }

  String get loginNoAccount {
    return Intl.message(
      "You don't have an account? ",
      name: 'loginNoAccount',
      locale: localeName,
    );
  }

  // #endregion "Login"

  // #region "Sign Up"

  String get signUpEmailError {
    return Intl.message(
      'signUpEmailError',
      name: 'signUpEmailError',
      locale: localeName,
    );
  }

  String get signUpPasswordError {
    return Intl.message(
      'signUpPasswordError',
      name: 'signUpPasswordError',
      locale: localeName,
    );
  }

  // #endregion "Sign Up"
}

class RGLocalizationsDelegate extends LocalizationsDelegate<RGLocalizations> {
  const RGLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      [kDefaultLocaleName].contains(locale.languageCode);

  @override
  Future<RGLocalizations> load(Locale locale) => RGLocalizations.load(locale);

  @override
  bool shouldReload(RGLocalizationsDelegate old) => false;
}
