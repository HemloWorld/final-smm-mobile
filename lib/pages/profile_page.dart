import 'package:flutter/material.dart';
//pub dev
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
//auth
import '../auth.dart';
//pages
import 'package:final_project/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  static String tag = 'profile-page';

  Widget _buildTitle(String title,) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      title,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(208,52,47,1),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 120),
            child: Container(
              //replace this Container with your Card
              color: Colors.white,
             child: Column(
               children: <Widget>[
                 SizedBox(height: 50,),
                 Flexible(
                   child: SingleChildScrollView(
                     child: Column(
                       children: <Widget>[
                         _buildTitle('Name'),
                         Padding(
                             padding: EdgeInsets.only(
                                 left: 25.0, right: 25.0, top: 2.0),
                             child: new Row(
                               mainAxisSize: MainAxisSize.max,
                               children: <Widget>[
                                 new Flexible(
                                   child: new TextField(
                                     decoration: const InputDecoration(
                                       icon: Icon(Icons.person),
                                       hintText: "Afina Putri D",
                                       enabled: false,
                                     ),
                                   ),
                                 ),
                               ],
                             )),
                         _buildTitle('Position'),
                         Padding(
                             padding: EdgeInsets.only(
                                 left: 25.0, right: 25.0, top: 2.0),
                             child: new Row(
                               mainAxisSize: MainAxisSize.max,
                               children: <Widget>[
                                 new Flexible(
                                   child: new TextField(
                                     decoration: const InputDecoration(
                                       icon: Icon(Icons.person_pin_circle),
                                       hintText: "Project Manager",
                                       enabled: false,
                                     ),
                                   ),
                                 ),
                               ],
                             )),
                         _buildTitle('Birth of Date'),
                         Padding(
                             padding: EdgeInsets.only(
                                 left: 25.0, right: 25.0, top: 2.0),
                             child: new Row(
                               mainAxisSize: MainAxisSize.max,
                               children: <Widget>[
                                 new Flexible(
                                   child: new TextField(
                                     decoration: const InputDecoration(
                                       icon: Icon(Icons.cake),
                                       hintText: "3 December 2000",
                                       enabled: false,
                                     ),
                                   ),
                                 ),
                               ],
                             )),
                         _buildTitle('Phone Number'),
                         Padding(
                             padding: EdgeInsets.only(
                                 left: 25.0, right: 25.0, top: 2.0),
                             child: new Row(
                               mainAxisSize: MainAxisSize.max,
                               children: <Widget>[
                                 new Flexible(
                                   child: new TextField(
                                     decoration: const InputDecoration(
                                       icon: Icon(Icons.phone),
                                       hintText: "085772610027",
                                       enabled: false,
                                     ),
                                   ),
                                 ),
                               ],
                             )),
                         _buildTitle('Email'),
                         Padding(
                             padding: EdgeInsets.only(
                                 left: 25.0, right: 25.0, top: 2.0),
                             child: new Row(
                               mainAxisSize: MainAxisSize.max,
                               children: <Widget>[
                                 new Flexible(
                                   child: new TextField(
                                     decoration: const InputDecoration(
                                       icon: Icon(Icons.cake),
                                       hintText: "afnpd03@gmail.com",
                                       enabled: false,
                                     ),
                                   ),
                                 ),
                               ],
                             )),
                         Padding(
                             padding: EdgeInsets.only(
                                 left: 25.0, right: 25.0, top: 25.0),
                             child: new Row(
                               mainAxisSize: MainAxisSize.max,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                 Expanded(
                                   child: Container(
                                     child: new Text(
                                       'Gender',
                                       style: TextStyle(
                                           color: Colors.black45,
                                           fontSize: 16.0,
                                           fontWeight: FontWeight.bold),
                                     ),
                                   ),
                                   flex: 2,
                                 ),
                                 Expanded(
                                   child: Container(
                                     child: new Text(
                                       'Blood Type',
                                       style: TextStyle(
                                           color: Colors.black45,
                                           fontSize: 16.0,
                                           fontWeight: FontWeight.bold),
                                     ),
                                   ),
                                   flex: 2,
                                 ),
                               ],
                             )),
                         Padding(
                             padding: EdgeInsets.only(
                                 left: 25.0, right: 25.0, top: 2.0),
                             child: new Row(
                               mainAxisSize: MainAxisSize.max,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                 Flexible(
                                   child: Padding(
                                     padding: EdgeInsets.only(right: 10.0),
                                     child: new TextField(
                                       decoration: const InputDecoration(
                                           icon: FaIcon(FontAwesomeIcons.venusMars,),hintText: "Female", enabled: false),
                                     ),
                                   ),
                                   flex: 2,
                                 ),
                                 Flexible(
                                   child: new TextField(
                                     decoration: const InputDecoration(
                                         icon: FaIcon(FontAwesomeIcons.tint, size: 20,),hintText: "O", enabled: false),
                                   ),
                                   flex: 2,
                                 ),
                               ],
                             )),
                         _buildTitle('Company'),
                         Padding(
                             padding: EdgeInsets.only(
                                 left: 25.0, right: 25.0, top: 2.0),
                             child: new Row(
                               mainAxisSize: MainAxisSize.max,
                               children: <Widget>[
                                 new Flexible(
                                   child: new TextField(
                                     decoration: const InputDecoration(
                                       icon: FaIcon(FontAwesomeIcons.building),
                                       hintText: "Berau Coal, PT",
                                       enabled: false,
                                     ),
                                   ),
                                 ),
                               ],
                             )),
                         SizedBox(height: 10,),
                         FlatButton(
                           onPressed: () {
                             signOutGoogle();
                             pushNewScreen(
                               context,
                               screen: LoginPage(),
                               platformSpecific: false,
                               withNavBar: false,
                             );
                           },
                           child: Text('Sign Out',
                             style: TextStyle(color: Color.fromRGBO(208,52,47,1), fontSize: 15),
                           ),
                         ),
                         SizedBox(height: 10,),

                       ],
                     ),
                   ),
                 )

               ],
             ),
            ),
          ),
          Positioned(
            top: 40,
            child:  Container(
              width: 150,
              height: 150,
              decoration:
              ShapeDecoration(shape: CircleBorder(), color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imageURL,
                          ))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }}