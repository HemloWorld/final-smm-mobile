import 'package:flutter/material.dart';

class HomeBNB extends StatefulWidget {
  @override
  _HomeBNBState createState() => _HomeBNBState();
}

class _HomeBNBState extends State<HomeBNB> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white),
            title: Text('Home'),
            backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_enhance,
              color: Colors.white,),
            title: Text('Absen'),
            backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,),
            title: Text('Profile'),
            backgroundColor: Colors.red
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        } ,
      );
  }
}