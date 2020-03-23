import 'package:flutter/material.dart';

class ValueProfile extends StatelessWidget {
  final IconData icon;
  final String label;

  ValueProfile({this.icon,this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 25.0, right: 25.0, top: 2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(icon, color: Colors.black45),
            SizedBox(width: 10,),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width/1.3,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFEBEEF1)),)
              ),
              child: Text(label,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16.0,),),
            ),
          ],
        ));
  }
}
