import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ihats/models/app_state.dart';



class ProductsPage extends StatefulWidget {

  final void Function() onInit;

  ProductsPage( { this.onInit});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  @override
  void initState() {

    // action usded to update the widget state.
    super.initState();

    widget.onInit();

  }


  final _appBar = PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return AppBar(
            centerTitle: true,
            title: SizedBox(
              child: state.user != null ? Text(state.user.username) : Text(''),
            ),
            leading: Icon(Icons.store),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: state.user != null ? IconButton(icon: Icon(Icons.exit_to_app),
                onPressed: () => print('pressed')) : Text(''),
              )
            ],
          );
        },
      ),
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(child: Text('products page'),),
    );
  }

  // _getUser() async {

  //   final prefs = await SharedPreferences.getInstance();

  //   var storedUser = prefs.getString('user');

  //   print(json.decode(storedUser));
  // }
}