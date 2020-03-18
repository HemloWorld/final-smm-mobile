import 'package:final_project/widgets/login_widget/email_field.dart';
import 'package:final_project/widgets/login_widget/login_button.dart';
import 'package:final_project/widgets/login_widget/password_field.dart';
import 'package:flutter/material.dart';
//pub dev
import 'package:flutter_signin_button/flutter_signin_button.dart';
//auth
import '../auth.dart';
import 'package:final_project/app_bar.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
//  var auth = getCurrentUser();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Widget _signWithGoogle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: SignInButton(
        Buttons.Google,
        onPressed: () {
          signInWithGoogle().then((log) {
            Navigator.of(context).pushReplacementNamed(Bar.tag);
          });
        },
      ),
    );
  }

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
            Text(
              '- OR -',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            _signWithGoogle(),
          ],
        ),
      )
    );
  }
}