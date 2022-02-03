import 'package:flutter/material.dart';
import 'package:login_with_sharedpreference/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              signOut(context);
            },
          ),
        ],
      ),
    );
  }

   signOut(BuildContext ctx) async {
    
     final _sharedPrefs = await SharedPreferences.getInstance();
     await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LoginPage()), (route) => false);
  }
}
