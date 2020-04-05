import 'package:final_project/pages/filter_date_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
  int selectedIndex = 0;
  final List<Widget> children = [
    HomePage(),
    FilterDatePage(),
    ListPage(),
    ProfilePage(),
    ScanNFCPage(),
  ];
  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFEBEEF1),
      body: children[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(208, 52, 47, 1),
        onPressed: () {
          updateTabSelection(4);
        },

        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.touch_app),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  updateTabSelection(0);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0
                      ? Color.fromRGBO(208, 52, 47, 1)
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.calendar_today,
                  color: selectedIndex == 1
                      ? Color.fromRGBO(208, 52, 47, 1)
                      : Colors.grey,
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.format_list_bulleted,
                  color: selectedIndex == 2
                      ? Color.fromRGBO(208, 52, 47, 1)
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.person,
                  color: selectedIndex == 3
                      ? Color.fromRGBO(208, 52, 47, 1)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}