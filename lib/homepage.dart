import 'package:flutter/material.dart';
import 'package:login_with_sharedpreference/loginpage.dart';

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

  void signOut(BuildContext ctx) async {
    Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (context) => ScreenLogin()));
  }
}
