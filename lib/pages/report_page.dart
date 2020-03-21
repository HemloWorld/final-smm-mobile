import 'package:final_project/auth.dart';
import 'package:final_project/pages/list_page.dart';
import 'package:final_project/widgets/presence_data.dart';
import 'package:final_project/widgets/profile_data.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  static String tag = 'report-page';
  final userData;
  // TODO : Pake data ini buat nampilin profilnya biar ga hardcode
  ReportPage(this.userData);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                delegate: MySliverAppBar(
                  expandedHeight: 280,
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    TabBar(
                      labelColor: Color.fromRGBO(208, 52, 47, 1),
                      unselectedLabelColor: Colors.black45,
                      tabs: [
                        new Tab(icon: new Icon(Icons.person), text: "ABOUT ME"),
                        new Tab(
                            icon: new Icon(Icons.format_list_bulleted),
                            text: "MONTHLY REPORT"),
                      ],
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              ProfileData(),
              PresenceData(),
            ],
          ),
        ),
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
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPage(),
                ),
              );
            },
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
//            FutureBuilder(
//              future: DioService().getHttp(),
//              builder: (context, response)
//              {
//                if(response.hasData) {
//                  return Expanded(
//                    child: ListView.builder(
//                      shrinkWrap: true,
//                      itemCount: response.data.length,
//                      itemBuilder: (BuildContext context, int index) {
//                        return
//                          Text(response.data[index]['name']);
//                      },
//                    ),
//                  );
//                }
//                return Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    SizedBox(height: MediaQuery.of(context).size.height / 3,),
//                    CircularProgressIndicator(),
//                  ],
//                );
//              },
//            )
