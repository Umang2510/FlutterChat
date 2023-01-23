import 'dart:developer';

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _useremail = '';
  String _username = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      print(_userPassword);
      print(_useremail);
      print(_username);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                TextFormField(
                  key: const ValueKey('email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please, Enter valid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _useremail = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                if (!_isLogin)
                  TextFormField(
                    key: const ValueKey('username'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Password must be atleast 4 characters long';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                TextFormField(
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Password must be atleast 7 characters long';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _userPassword = value!;
                  },
                  //keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: _trySubmit,
                  child: Text(_isLogin ? 'Login' : 'Signup'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(_isLogin
                      ? 'Create an Account'
                      : 'Already have an Account? Login'),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
