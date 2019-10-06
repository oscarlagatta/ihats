


// getUserAction // dispatch to the THUNK (middleware)

import 'dart:convert';

import 'package:ihats/models/app_state.dart';
import 'package:ihats/models/user.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';


// USER ACTIONS

ThunkAction<AppState> getUserAction = (Store<AppState> store) async {
 
  final prefs = await SharedPreferences.getInstance();

  final String storedUser = prefs.getString('user');

  final user = storedUser != null ? User.fromJson(json.decode(storedUser)) : null;

  store.dispatch(GetUserAction(user));

};

class GetUserAction {
  final User _user;

  User get user => this._user;

  GetUserAction(this._user);
}


// GetUserAction  // dispatch to the Reducer action
