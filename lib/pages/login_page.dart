import 'package:final_project/widgets/email_field.dart';
import 'package:final_project/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Widget _loginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 1,
        onPressed: () {Navigator.of(context).pushReplacementNamed(Bar.tag);},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.red,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

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
            _loginButton(),
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