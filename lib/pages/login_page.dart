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
  Widget _fieldEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Username', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 40.0,
          child: TextField(
            controller: null,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black45,
                size: 20,
              ),
              hintText: 'Enter your Username',
              hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fieldPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 40.0,
          child: TextField(
            controller: null,
            obscureText: true,
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black45,
                size: 20,
              ),
              hintText: 'Enter your Password',
              hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

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
            _fieldEmail(),
            SizedBox(height: 20.0,),
            _fieldPassword(),
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