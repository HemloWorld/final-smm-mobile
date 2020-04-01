import 'package:final_project/blocs/profile_bloc.dart';
import 'package:final_project/widgets/presence_data.dart';
import 'package:final_project/widgets/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPage extends StatefulWidget {
  static String tag = 'report-page';
  final Map<String, dynamic> user;

  ReportPage(this.user);
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => ProfileBloc(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(208, 52, 47, 1),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 130),
              child: Container(
                //replace this Container with your Card
                color: Colors.white,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      TabBar(
                        labelColor: Color.fromRGBO(208, 52, 47, 1),
                        unselectedLabelColor: Colors.black45,
                        tabs: [
                          Tab(icon: Icon(Icons.person), text: "ABOUT ME"),
                          Tab(
                              icon: Icon(Icons.format_list_bulleted),
                              text: "MONTHLY REPORT"),
                        ],
                      ),
                      Container(
                        child: Flexible(
                          child: TabBarView(
                            children: [
                              ProfileData(
                                user: widget.user,
                              ),
                              PresenceData(
                                userId: widget.user['id'],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              child: Container(
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
                        image: NetworkImage(
                          widget.user['photoUrl'],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
