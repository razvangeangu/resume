import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterstarter/rg-localizations.dart';
import 'package:flutterstarter/services/messaging.dart';
import 'package:flutterstarter/utils/rg-constants.dart';
import 'package:flutterstarter/utils/rg-routes.dart';
import 'package:flutterstarter/utils/rg-shared.dart';
import 'package:flutterstarter/utils/rg-theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  StatelessElement createElement() {
    if (!kIsWeb) {
      Messaging.instance.init();
    }

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) => locale,
      localizationsDelegates: [
        const RGLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale(kDefaultLocaleName),
      ],
      debugShowCheckedModeBanner: false,
      navigatorKey: RGShared.instance.navigatorKey,
      title: RGLocalizations.of(context)?.appName ?? 'flutterstarter',
      theme: RGTheme.light,
      darkTheme: RGTheme.dark,
      themeMode: ThemeMode.light,
      initialRoute: RGRoutes.root,
      routes: RGRoutes.routes,
    );
  }
}
