import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: Text('Home')),
    Center(child: Text('Absen')),
    Center(child: Text('Profile'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}