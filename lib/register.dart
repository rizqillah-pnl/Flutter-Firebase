import 'package:flutter/material.dart';
import 'auth_services2.dart';
import 'color.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController user = TextEditingController(text: "");
  TextEditingController password1 = TextEditingController(text: "");
  TextEditingController password2 = TextEditingController(text: "");
  static const routeName = "/registerPage";
  String password = null;
  String username = null;
  List akun = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconRegister(),
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconRegister() {
    return Icon(
      Icons.contact_mail_outlined,
      color: Colors.white,
      size: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Registration",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed odio felis, gravida id congue nec, imperdiet quis diam. Sed auctor efficitur cursus. Sed blandit porta elit a cursus. Etiam nunc nibh, auctor ut justo et, convallis mattis dui.",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Form(
          autovalidate: true,
          child: TextFormField(
            validator: validatorUsername,
            controller: user,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPalette.underlineTextField,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              hintText: "Username",
              hintStyle: TextStyle(color: ColorPalette.hintColor),
            ),
            style: TextStyle(color: Colors.white),
            autofocus: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Form(
          autovalidate: true,
          child: TextFormField(
            validator: validatorPassword,
            controller: password1,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPalette.underlineTextField,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: ColorPalette.hintColor),
            ),
            style: TextStyle(color: Colors.white),
            obscureText: true,
            autofocus: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Form(
          autovalidate: true,
          child: TextFormField(
            validator: validatorConfirm,
            controller: password2,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorPalette.underlineTextField,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              hintText: "Confirm Password",
              hintStyle: TextStyle(color: ColorPalette.hintColor),
            ),
            style: TextStyle(color: Colors.white),
            obscureText: true,
            autofocus: false,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: TextButton(
              child: Text(
                "Register",
                style: TextStyle(color: ColorPalette.primaryColor),
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                await AuthServices.signUp(user.text, password1.text);
              },
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "or",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
        TextButton(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
      ],
    );
  }

  String validatorUsername(String value) {
    if (value.length < 3) return 'Harus lebih 2 huruf';

    username = value;
    return null;
  }

  String validatorPassword(String value) {
    if (value.length <= 5) return 'Harus lebih 5 huruf';

    password = value;
    return null;
  }

  String validatorConfirm(String value) {
    if (value == password) {
      if (value.length <= 5) {
        return 'Harus lebih 5 huruf';
      } else {
        return null;
      }
    } else {
      return 'Password Konfirmasi Salah';
    }
  }
}
