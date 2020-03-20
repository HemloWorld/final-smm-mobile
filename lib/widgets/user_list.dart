import 'dart:typed_data';

import 'package:final_project/pages/report_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserList extends StatelessWidget {
  final List datas;

  UserList(this.datas);
  Uint8List _bytesImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder
          (itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(datas[index]['photoUrl']), // no matter how big it is, it won't overflow
                ),
                title: Text(datas[index]['name'].toString()),
                subtitle: Text(datas[index]['departmentId'].toString()),
                trailing: FaIcon(
                  FontAwesomeIcons.circle,
                  color: Colors.green,
                ),
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportPage(),
                  ),
                );},
              ),
            );
            },
          itemCount: datas.length,));
    }
}
