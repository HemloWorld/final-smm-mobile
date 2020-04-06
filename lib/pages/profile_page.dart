import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/blocs/profile_bloc.dart';
import 'package:final_project/widgets/profile_page_widget/logout_button.dart';
import 'package:final_project/widgets/profile_page_widget/my_sliver_appbar.dart';
import 'package:final_project/widgets/report_page_widget/title_profile.dart';
import 'package:final_project/widgets/report_page_widget/value_profile.dart';
import 'package:final_project/widgets/report_page_widget/value_profile_expanded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ProfilePage extends StatelessWidget {
  static String tag = 'profile-page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, BlocState>(
        builder: (context, state) {
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
                        TitleProfile(
                          title: 'Name',
                        ),
                        ValueProfile(
                            icon: Icons.person, label: 'Afina Putri D'),
                        TitleProfile(
                          title: 'Position',
                        ),
                        ValueProfile(
                            icon: Icons.person_pin_circle,
                            label: 'Project Manager'),
                        TitleProfile(
                          title: 'Birth of Date',
                        ),
                        ValueProfile(
                            icon: Icons.cake, label: '03 December 2000'),
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
                                left: 15.0, right: 25.0, top: 2.0),
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
                        LogOutButton()
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
