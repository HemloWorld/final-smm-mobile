import 'package:final_project_mobile_app/widget/bottomnavbar_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBNB(),
    );
  }
}