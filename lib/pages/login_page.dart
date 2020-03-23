import 'package:final_project/widgets/login_widget/divider_text.dart';
import 'package:final_project/widgets/login_widget/email_field.dart';
import 'package:final_project/widgets/login_widget/google_login_button.dart';
import 'package:final_project/widgets/login_widget/login_button.dart';
import 'package:final_project/widgets/login_widget/password_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
//  var auth = getCurrentUser();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Image.asset('assets/logo.png'),
            SizedBox(height: 80.0),
            EmailField(),
            SizedBox(height: 20.0,),
            PasswordField(),
            SizedBox(height: 10.0,),
            LoginButton(),
            DividerText(),
            GoogleLoginButton(),
          ],
        ),
      )
    );
  }
}