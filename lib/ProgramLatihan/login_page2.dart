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
        appBar: AppBar(
          title: Text('RIZQILLAH / 1957301020 - MAIN'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 100,
                child: Form(
                  autovalidate: true,
                  child: TextFormField(
                    validator: validatorUsername,
                    controller: emailController,
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 100,
                child: Form(
                  autovalidate: true,
                  child: TextFormField(
                    validator: validatorPassword,
                    controller: passwordController,
                    obscureText: true,
                  ),
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

  String validatorUsername(String value) {
    if (value.length < 3)
      return 'Harus lebih 2 huruf';
    else
      return null;
  }

  String validatorPassword(String value) {
    if (value.length <= 5)
      return 'Harus lebih 5 huruf';
    else
      return null;
  }
}
