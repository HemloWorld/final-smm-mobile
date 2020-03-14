import 'package:final_project_mobile_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinarmas employee app',
      home: HomeScreen(),
    );
  }
}