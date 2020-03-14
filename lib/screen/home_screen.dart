import 'package:final_project_mobile_app/widget/bottomnavbar_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'test',
              style: TextStyle(
                color: Colors.black
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: HomeBNB(),
    );
  }
}