import 'package:final_project/auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _checkTask = false;
  String textResult;
  String txt =' ';

  void result() {
    setState(() {
      txt = 'You`re finished. Congratulations! On completing tasks today!';
    });
  }


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
                  padding: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Todays Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEBEEF1),
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 32),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(imageURL)                     
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15, left: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello, $name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Color(0xFFEBEEF1)
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'You have 3 tasks today',
                          style: TextStyle(
                              color: Color(0xFFEBEEF1),
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
          padding: EdgeInsets.only(left: 32, bottom: 10),
          child: Text(
            '${DateFormat('EEEE, d MMM yyyy').format(DateTime.now())}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
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
                    padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFEBEEF1),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40))
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Checkbox(
                                value: _checkTask,
                                checkColor: Color.fromRGBO(208,52,47,1),
                                activeColor: Color(0xFFEBEEF1),
                                onChanged: (value) {
                                  setState(() {
                                    _checkTask = value;
                                  });
                                },
                              ),
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
                                        color: Colors.black45,
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
                                color: Colors.black45,
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
//        Center(
//          child: Column(
//            children: <Widget>[
//              SizedBox(height: 12),
//              MainButton(
//                text: 'Submit',
//                onClickEvent: result,
//              ),
//              Text('$txt', style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  color: Colors.black45,
//                  fontSize: 16
//              ),),
//            ],
//          ),
//        ),
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