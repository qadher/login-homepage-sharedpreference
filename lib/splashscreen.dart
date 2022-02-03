import 'package:flutter/material.dart';
import 'package:login_with_sharedpreference/homepage.dart';
import 'package:login_with_sharedpreference/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splashImage.png',
          height: 300,
        ),
      ),
    );
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPreferences.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || !_userLoggedIn) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomePage()));
    }
  }
}
