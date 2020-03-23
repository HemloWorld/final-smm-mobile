import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../app_bar.dart';
import '../../auth.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      height: 100,
      child: SignInButton(
        Buttons.Google,
        onPressed: () {
          signInWithGoogle().then((log) {
            Navigator.of(context).pushReplacementNamed(Bar.tag);
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
      ),
    );
  }
}