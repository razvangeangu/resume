import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resume/rg-localizations.dart';
import 'package:resume/services/messaging.dart';
import 'package:resume/utils/rg-constants.dart';
import 'package:resume/utils/rg-routes.dart';
import 'package:resume/utils/rg-shared.dart';
import 'package:resume/utils/rg-theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
