import 'package:flutter/material.dart';
import 'package:ihats/pages/login_page.dart';
import 'package:ihats/pages/products_page.dart';
import 'package:ihats/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/products': (BuildContext context) => ProductsPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(),
      },
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

/**
 * shared preferences for presisting user data
 * setting up redux 
 * getting user data through redux
 * modeling the user data
 * improving products page
 * style using gradinets
 * adding product content
 * gried view builder
 * formatting individual products
 * modeling data
 * using media query widget
 * 
 */