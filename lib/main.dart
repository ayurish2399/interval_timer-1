import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'About.dart';
import 'SetTimer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightGreenAccent[700],
        accentColor: Colors.greenAccent[400],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SetTimer(),
        '/about': (context) => About(),
      },
    );
  }
}
