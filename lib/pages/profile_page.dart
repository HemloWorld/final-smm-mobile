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

    @override
  Widget _partOfProfile(IconData icon, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 4.0),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal:25 ),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 50.0,
          child: ListTile(
            leading: FaIcon(
              icon,
              color: Colors.black45,
              size: 20,
            ),
            title: Text(
              label,
              style:
              TextStyle(color: Colors.black45, fontSize: 16),
            ),
          ),
        ),
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
              delegate: MySliverAppBar(expandedHeight: 280,),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 20,),
                _partOfProfile(Icons.person, name),
                _partOfProfile(Icons.person_pin_circle, 'Project Manager'),
                _partOfProfile(Icons.cake, 'Jan 12 1993'),
                _partOfProfile(Icons.location_on, 'Bradford, West Yorkshire, Inggris'),
                _partOfProfile(Icons.phone, '+122 XXXX XXXX'),
                _partOfProfile(Icons.email, email),
                _partOfProfile(FontAwesomeIcons.globeAsia, 'zaynmalik.com'),
                _partOfProfile(FontAwesomeIcons.building, 'Berau Coal, PT'),
                ConstrainedBox(
                  child: Column(
                    children: <Widget>[
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
                    )],
                  ),
                  constraints: BoxConstraints(maxHeight: 50.0, minHeight: 50.0),
                ),]),
            ),
          ],
        ),
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
        Container(color:  Color.fromRGBO(208,52,47,1),),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 40 -shrinkOffset,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Opacity(
              opacity: (1 - shrinkOffset / expandedHeight),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imageURL),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
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
          )
        )
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