import 'package:final_project/services/time_service.dart';
import 'package:final_project/widgets/report_page_widget/title_profile.dart';
import 'package:final_project/widgets/report_page_widget/value_profile.dart';
import 'package:final_project/widgets/report_page_widget/value_profile_expanded.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileData extends StatelessWidget {
  final user;

  ProfileData({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TitleProfile(
            title: 'Name',
          ),
          ValueProfile(icon: Icons.person, label: user['name']),
          TitleProfile(
            title: 'Department',
          ),
          ValueProfile(icon: Icons.person_pin_circle, label: user['department']['name']),
          TitleProfile(
            title: 'Birth of Date',
          ),
          ValueProfile(icon: Icons.cake, label: TimeService().beautifyDate(user['birth'])),
          TitleProfile(
            title: 'Phone Number',
          ),
          ValueProfile(icon: Icons.phone, label: user['phone']),
          TitleProfile(
            title: 'Email',
          ),
          ValueProfile(icon: Icons.email, label: user['email']),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleProfile(
                      title: 'Gender',
                    ),
                    ValueProfileExpanded(
                      icon: FontAwesomeIcons.venusMars,
                      label: user['gender']['gender'],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleProfile(
                      title: 'Blood Type',
                    ),
                    ValueProfileExpanded(
                      icon: FontAwesomeIcons.tint,
                      label: user['bloodType']['type'],
                    ),
                  ],
                ),
              ),
            ],
          ),
            TitleProfile(
              title: 'Company',
            ),
            ValueProfile(
              icon: FontAwesomeIcons.building,
              label: 'Berau Coal, PT',
            ),
           SizedBox(
             height: 30,
           )
        ],
      ),
    ));
  }
}
