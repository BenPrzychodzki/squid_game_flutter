import 'package:flutter/material.dart';
import 'package:squid_game_flutter/pages/general_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: "Squid Game",
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
            elevation: 0.0)),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Colors.transparent,
        ),
      ),
      home: const GeneralView(),
    );
  }
}
