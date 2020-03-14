import 'package:final_project/app_bar.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
final routes = <String, WidgetBuilder>{
  Bar.tag:(context) => Bar(),
  LoginPage.tag:(context) => LoginPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}