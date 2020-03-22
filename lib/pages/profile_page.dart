import 'package:final_project/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../auth.dart';

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
    return SafeArea(
        child: Material(
          child: CustomScrollView(
           slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(
                    expandedHeight: 280,
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
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
                )
              ]
          ),
        ));
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          color: Color.fromRGBO(208, 52, 47, 1),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "Afina Putri",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
            top: expandedHeight / 40 - shrinkOffset,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageURL),
                                fit: BoxFit.cover),
                            borderRadius:
                            BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, color: Colors.grey)
                            ])),
                    SizedBox(height: 20.0),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Project Manager',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

