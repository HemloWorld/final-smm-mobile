import 'package:flutter/material.dart';
//pub dev
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
//pages
import 'package:final_project/pages/home_page.dart';
import 'package:final_project/pages/profile_page.dart';
import 'package:final_project/pages/scan_nfc_page.dart';
import 'package:final_project/pages/list_page.dart';

class Bar extends StatefulWidget {
  static String tag = 'app';

  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      ScanNFCPage(),
      ListPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColor: Color.fromRGBO(208, 52, 47, 1),
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_overscan),
        title: ("Barcode"),
        activeColor: Color.fromRGBO(208, 52, 47, 1),
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list),
        title: ("List"),
        activeColor: Color.fromRGBO(208, 52, 47, 1),
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColor: Color.fromRGBO(208, 52, 47, 1),
        inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      showElevation: false,
      isCurved: true,
      backgroundColor: const Color(0xFFEBEEF1),
      iconSize: 26.0,
      navBarStyle: NavBarStyle.style5,
    );
  }
}