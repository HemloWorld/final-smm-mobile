import 'package:final_project/auth.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:final_project/widgets/media_query.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: displayHeight(context) * 1),
          FlatButton(
            child: Text(
              'Sign Out',
              style: TextStyle(
                  color: Color.fromRGBO(208, 52, 47, 1), fontSize: 15),
            ),
            onPressed: () {
              signOutGoogle();
              pushNewScreen(
                context,
                screen: LoginPage(),
                platformSpecific: false,
                withNavBar: false,
              );
            },
          ),
          SizedBox(height: displayHeight(context) * 5),
        ],
      ),
    );
  }
}
