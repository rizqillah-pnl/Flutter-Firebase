import 'package:flutter/material.dart';
import 'login_page2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_page2.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    return (firebaseUser == null) ? LoginPage() : MainPage(firebaseUser);
  }
}
