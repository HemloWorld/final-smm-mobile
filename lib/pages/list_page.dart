
import 'package:final_project/services/dio_service.dart';
import 'package:final_project/widgets/user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListPage extends StatelessWidget {
  static String tag = 'list-tag';

    Widget _fieldSearchName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
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
          height: 40.0,
          width: 300,
          child: TextField(
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6.0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black45,
                size: 20,
              ),
              hintText: 'Search by name',
              hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
              
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchByScanOrNFC (IconData icon){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FaIcon(icon, color: Colors.black45, size: 30,),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _searchByScanOrNFC(Icons.settings_overscan),
              _searchByScanOrNFC(Icons.nfc),
              _fieldSearchName(),
            ],
          ),
          FutureBuilder(
            future: DioService().getHttp(),
            builder: (context, response)
            {
              if(response.hasData) {
                return UserList(response.data);
              }
              return Column(
                children: <Widget>[
                  // SizedBox(height: MediaQuery.of(context).size.height / 3,),
                  Image.asset('assets/MagnumOpusTrans.png'),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}


//
//class ListPage extends StatefulWidget {
//  static String tag='list-page';
//
//  @override
//  _ListPageState createState() => _ListPageState();
//}
//
//
//class _ListPageState extends State<ListPage> {
//  Widget _fieldSearchName() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Container(
//          alignment: Alignment.centerLeft,
//          decoration: BoxDecoration(
//            color: Colors.white54,
//            borderRadius: BorderRadius.circular(10.0),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.black12,
//                blurRadius: 6.0,
//                offset: Offset(0, 2),
//              ),
//            ],
//          ),
//          height: 40.0,
//          width: 300,
//          child: TextField(
//            style: TextStyle(
//              color: Colors.black45,
//              fontFamily: 'OpenSans',
//            ),
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              contentPadding: EdgeInsets.only(top: 6.0),
//              prefixIcon: Icon(
//                Icons.search,
//                color: Colors.black45,
//                size: 20,
//              ),
//              hintText: 'Search by name',
//              hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//
//  Widget _searchByScanOrNFC (IconData icon){
//      return Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//          FaIcon(icon, color: Colors.black45, size: 30,),
//        ],
//      );
//  }
//
//
//  List<User> filteredUsers = List();
//  var users = new List<User>();
//
//  _getUsers() {
//    API.getUsers().then((response) {
//      setState(() {
//        Iterable list = json.decode(response.body);
//        users = list.map((model) => User.fromJson(model)).toList();
//      });
//    });
//  }
//
//  initState() {
//    super.initState();
//    _getUsers();
//  }
//
//  dispose() {
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Column(
//        children: <Widget>[
//          SizedBox(height: 50,),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              _searchByScanOrNFC(Icons.settings_overscan),
//              _searchByScanOrNFC(Icons.nfc),
//              _fieldSearchName(),
//            ],
//          ),
//        Container(
//         child:  Flexible(
//           child: ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                   title: Text(users[index].name),
//                   trailing:FaIcon(
//                     FontAwesomeIcons.circle,
//                     color: Colors.green,
//                   ),
//                    onTap: (){},
////                   FaIcon(FontAwesomeIcons.infoCircle)
//               );
//             },
//           ),
//         ),
//        )
//        ],
//      )
//    );
//  }
//}
