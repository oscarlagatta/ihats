import 'package:flutter/material.dart';
import 'package:ihats/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iHats',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.pink[50],
        accentColor: Colors.blue[50],
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 18.0,)
        )
      ),
      home: RegisterPage(),
    );
  }
}