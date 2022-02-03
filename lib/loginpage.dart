import 'package:flutter/material.dart';
import 'package:login_with_sharedpreference/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // email and password textediting controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 32.0),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      // labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      //labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      //RegExp minimum 6 characters
                      RegExp regExp = RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      signIn(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
   signIn(BuildContext ctx) async {
    if (_formKey.currentState!.validate()) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
