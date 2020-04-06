import 'package:final_project/auth.dart';
import 'package:final_project/widgets/media_query.dart';
import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: displayHeight(context) * 40,
            width: displayWidth(context)*100,
            color: Colors.black45,
            child: Image.asset('assets/example2.png', fit: BoxFit.fitWidth,)
          ),
          Positioned(
            left: displayHeight(context)*2,
            top: displayHeight(context)*32,
            child:  Text(
              'Hello $name, Have a great day !',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white
              ),
            ),
          ),
          Positioned(
            right: displayWidth(context)*10,
            top: displayHeight(context)*5,
            child : SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL)
                ),
              ),
          ),
          Positioned(
            right: displayWidth(context)*10,
            top: displayHeight(context)*20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${DateFormat('EEEE, d MMM yyyy').format(DateTime.now())}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                Text(
                  'Jakarta, Indonesia',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(top: displayHeight(context)*50),
            child: Container(
              width: displayWidth(context) * 100,
              height: displayHeight(context) * 25,
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
                          width: displayWidth(context) * 50,
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
                                  SizedBox(width: displayWidth(context) * 3),
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
                              SizedBox(height : displayHeight(context) * 1),
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
          )
        ],
      ),
    );
  }
}
