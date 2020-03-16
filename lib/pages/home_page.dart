import 'package:final_project/auth.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipPath(
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.redAccent,Colors.red[800]],
                  radius: 1
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Todays Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 32),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image(image: NetworkImage(imageURL,),),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15, left: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello, ${name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.white70
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'You have 3 tasks today',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          clipper: MyWavyClipper(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32, bottom: 20),
          child: Text(
            'Senin, 16 Maret 2019',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          padding: EdgeInsets.only(left: 32),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20, top: 20),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40))
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.assignment_turned_in, color: Colors.grey[800]),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Task no ${index+1}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                        fontSize: 22
                                    ),
                                  ),
                                  Text(
                                    '09 : 00 AM',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                        fontSize: 16
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Mengecek alat absen',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 14
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class MyWavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    var path = Path();

    path.lineTo(0, size.height - 80);

    path.quadraticBezierTo(0.3 * size.width, size.height, 0.68 * size.width, size.height - 80);

    path.lineTo(0.68 * size.width, size.height - 80);

    path.quadraticBezierTo(0.8416 * size.width, size.height - 120, size.width, size.height - 80);

    path.lineTo(size.width, size.height - 80);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}