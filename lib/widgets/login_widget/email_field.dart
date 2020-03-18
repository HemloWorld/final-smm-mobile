import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Username', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
        SizedBox(height: 5.0),
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
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black45,
                size: 20,
              ),
              hintText: 'Enter your Username',
              hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}