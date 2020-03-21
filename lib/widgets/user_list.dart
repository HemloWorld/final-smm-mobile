import 'dart:typed_data';

import 'package:final_project/pages/report_page.dart';
import 'package:final_project/services/time_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserList extends StatelessWidget {
  final List datas;
  UserList(this.datas);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) {
        bool isPresent = datas[index]['attendances'][0]['date'] == TimeService().getDate();
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(datas[index]['photoUrl']), // no matter how big it is, it won't overflow
            ),
            title: Text(datas[index]['name']),
            subtitle: Text(datas[index]['department']['name']),
            trailing: FaIcon(
              isPresent?FontAwesomeIcons.checkCircle : FontAwesomeIcons.circle,
              color: isPresent?Colors.green : Colors.red,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportPage(datas),
                ),
              );
            },
          ),
        );
      },
      itemCount: datas.length,
    ));
  }
}
