import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserList extends StatelessWidget {
  final List datas;

  UserList(this.datas);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder
          (itemBuilder: (context, index) {
            return Card(
              child: ListTile(

                title: Text(datas[index]['Name'].toString()),
                trailing: FaIcon(
                  FontAwesomeIcons.userCircle,
                  color: Colors.green,
                ),
                onTap: (){},
              ),
            );
            },
          itemCount: datas.length,));
    }
}
