import 'package:Resume/rg-localizations.dart';
import 'package:Resume/services/messaging.dart';
import 'package:Resume/utils/rg-constants.dart';
import 'package:Resume/utils/rg-routes.dart';
import 'package:Resume/utils/rg-shared.dart';
import 'package:Resume/utils/rg-theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      title: RGLocalizations.of(context)?.appName ?? 'Resume',
      theme: RGTheme.light,
      darkTheme: RGTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: RGRoutes.root,
      routes: RGRoutes.routes,
    );
  }
}
