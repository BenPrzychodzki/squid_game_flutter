import 'package:flutter/material.dart';
import 'package:squid_game_flutter/pages/general_view.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Squid Game",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Colors.transparent,
        ),
      ),
      home: const GeneralView(),
    );
  }
}
