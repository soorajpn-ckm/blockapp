import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          height: 70,
          child: Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/google_icon.png',
                    height: 70,
                  ),
                ),
                Text(
                  'Login with Google',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
