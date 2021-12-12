import 'package:flutter/material.dart';
import 'auth_services2.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 100,
                child: TextField(
                  controller: emailController,
                ),
              ),
              Container(
                width: 300,
                height: 100,
                child: TextField(
                  controller: passwordController,
                ),
              ),
              ElevatedButton(
                child: Text('Sign In Anonymous'),
                onPressed: () async {
                  await AuthServices.signInAnonymous();
                },
              ),
              ElevatedButton(
                child: Text('Sign In'),
                onPressed: () async {
                  await AuthServices.signIn(emailController.text, passwordController.text);
                },
              ),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  await AuthServices.signUp(emailController.text, passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
