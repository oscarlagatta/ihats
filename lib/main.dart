import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ihats/models/app_state.dart';
import 'package:ihats/pages/login_page.dart';
import 'package:ihats/pages/products_page.dart';
import 'package:ihats/pages/register_page.dart';
import 'package:ihats/state/actions.dart';
import 'package:ihats/state/reducers.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  
  final store = Store<AppState>(appReducer, initialState: AppState.initial(), middleware: [thunkMiddleware] );
  runApp(MyApp(store: store,));
  
}

class MyApp extends StatelessWidget {

  final Store<AppState> store;

  MyApp({ this.store });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider( 
      store: store,
      child: MaterialApp(
      routes: {
        '/products': (BuildContext context) => ProductsPage(
          onInit: () {
            // dispatch an action (getUserAction) to grab the user data
            // interact with the api, with a thunk action
            StoreProvider.of<AppState>(context).dispatch(getUserAction);
            // get products
            StoreProvider.of<AppState>(context).dispatch(getProductsAction);
          }
        ),
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
    ));
  }
}

/**
 * shared preferences for presisting user data (X)
 * setting up redux (X)
 * // side note FLUTTER FOR WEB. https://developers.google.com/web/progressive-web-apps/ 
 * getting user data through redux (x)
 * modeling the user data (x)
 * improving products page
 * style using gradinets
 * adding product content
 * gried view builder
 * formatting individual products
 * modeling data
 * using media query widget
 * 
 */