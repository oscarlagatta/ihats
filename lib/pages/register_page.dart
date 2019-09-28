import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  String _username, _email, _password;

  Widget _showTitle() {
    return Text('Register', style: Theme.of(context).textTheme.headline);
  }

  Widget _showUserNameInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _username = val,
        validator: (val) => val.length < 6 ? 'Username too short' : null,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter Username, min length 7',
            icon: Icon(
              Icons.face,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _email = val,
        validator: (val) => !val.contains('@') ? 'Invalid Email' : null,
        decoration: InputDecoration(            
            border: OutlineInputBorder(),
            labelText: 'Email',
            hintText: 'Enter a valid email',
            icon: Icon(
              Icons.alternate_email,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(    
        onSaved: (val) => _password = val,   
        validator: (val) => val.length < 6 ? 'Password too short' : null, 
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Enter password, min length 6',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget _showFormActions() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Submit',
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.black)),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            color: Theme.of(context).primaryColor,
            onPressed: () => _submit,
          ),
          FlatButton(
            child: Text('Existing User? Login'),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          )
        ],
      ),
    );
  }

  void _submit() {
    final form  = _formKey.currentState;
   
    if(form.validate()) {
      form.save();

      print('Username: $_username, Email: $_email, Password: $_password');

    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register in iHat')),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _showTitle(),
                    _showUserNameInput(),
                    _showEmailInput(),
                    _showPasswordInput(),
                    _showFormActions(),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}