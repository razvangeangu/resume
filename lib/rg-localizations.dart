// https://flutter.dev/docs/development/accessibility-and-localization/internationalization#dart-tools

// flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/bn-localizations.dart
// flutter pub run intl_translation:generate_from_arb \
// --output-dir=lib/l10n --no-use-deferred-loading \
// lib/bn-localizations.dart lib/l10n/intl_*.arb

import 'package:flutter/material.dart';
import 'package:flutterstarter/l10n/messages_all.dart';
import 'package:flutterstarter/utils/rg-constants.dart';
import 'package:intl/intl.dart';

class RGLocalizations {
  RGLocalizations(this.localeName);

  static Future<RGLocalizations> load(Locale locale) {
    final String name = locale.countryCode != null && locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return RGLocalizations(localeName);
    });
  }

  static RGLocalizations of(BuildContext context) {
    return Localizations.of<RGLocalizations>(context, RGLocalizations);
  }

  final String localeName;

  // #region "Globals"

  String get appName {
    return Intl.message(
      'flutterstarter',
      name: 'appName',
      locale: localeName,
    );
  }

  // #endregion "Globals"

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

class NBLocalizationsDelegate extends LocalizationsDelegate<RGLocalizations> {
  const NBLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      [kDefaultLocaleName].contains(locale.languageCode);

  @override
  Future<RGLocalizations> load(Locale locale) => RGLocalizations.load(locale);

  @override
  bool shouldReload(NBLocalizationsDelegate old) => false;
}
