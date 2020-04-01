import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/blocs/profile_bloc.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:final_project/widgets/report_page_widget/title_profile.dart';
import 'package:final_project/widgets/report_page_widget/value_profile.dart';
import 'package:final_project/widgets/report_page_widget/value_profile_expanded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../auth.dart';

class ProfilePage extends StatelessWidget {
  static String tag = 'profile-page';
  Widget _buildTitle(String title) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
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
    return BlocProvider<ProfileBloc>(
      create: (_) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, BlocState>(
        builder: (context, state) {
          return SafeArea(
            child: Material(
              child: CustomScrollView(slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(
                    expandedHeight: 280,
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      TitleProfile(
                        title: 'Name',
                      ),
                      ValueProfile(icon: Icons.person, label: 'Afina Putri D'),
                      TitleProfile(
                        title: 'Position',
                      ),
                      ValueProfile(
                          icon: Icons.person_pin_circle,
                          label: 'Project Manager'),
                      TitleProfile(
                        title: 'Birth of Date',
                      ),
                      ValueProfile(icon: Icons.cake, label: '03 December 2000'),
                      TitleProfile(
                        title: 'Phone Number',
                      ),
                      ValueProfile(icon: Icons.phone, label: '085772610027'),
                      TitleProfile(
                        title: 'Email',
                      ),
                      ValueProfile(
                          icon: Icons.email, label: 'afnpd03@gmail.com'),
                      Padding(
                          padding: EdgeInsets.only(
                            right: 25.0,
                          ),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: TitleProfile(
                                  title: 'Gender',
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: TitleProfile(
                                  title: 'Blood Type',
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
                                child: ValueProfileExpanded(
                                    icon: FontAwesomeIcons.venusMars,
                                    label: 'Female'),
                                flex: 2,
                              ),
                              Flexible(
                                child: ValueProfileExpanded(
                                    icon: FontAwesomeIcons.tint, label: 'O'),
                                flex: 2,
                              ),
                            ],
                          )),
                      TitleProfile(
                        title: 'Company',
                      ),
                      ValueProfile(
                        icon: FontAwesomeIcons.building,
                        label: 'Berau Coal, PT',
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                              color: Color.fromRGBO(208, 52, 47, 1),
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
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
