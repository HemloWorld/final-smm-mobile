import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeBNB extends StatefulWidget {
  @override
  _HomeBNBState createState() => _HomeBNBState();
}

class _HomeBNBState extends State<HomeBNB> {

  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.red,
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.red[40],
      height: 50,
      animationCurve: Curves.decelerate,
      animationDuration: Duration(
        milliseconds: 500
      ),
        // currentIndex: _currentIndex,
      items: <Widget> [
        Icon(Icons.home, size: 20, color: Colors.white),
        Icon(Icons.camera_enhance, size: 20, color: Colors.white),
        Icon(Icons.person, size: 20, color: Colors.white)
      ],
        onTap: (index) {
          setState(() {
            print(index);
          });
        } ,
      );
  }
}