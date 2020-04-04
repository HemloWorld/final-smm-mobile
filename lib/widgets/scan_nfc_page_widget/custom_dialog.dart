import 'package:final_project/pages/scan_nfc_page.dart';
import 'package:final_project/widgets/scan_nfc_page_widget/value_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDialog extends StatelessWidget {
  final data;
  CustomDialog(this.data);

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                data['name'],
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10,),
              ValueProfile(icon: Icons.person_pin_circle, label: data['department']['name']),
              ValueProfile(icon: Icons.phone, label: data['phone']),
              ValueProfile(icon: Icons.email, label: data['email']),
              ValueProfile(icon: FontAwesomeIcons.tint, label: data['bloodType']['type']),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ScanNFCPage()));
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: Consts.avatarRadius,
                backgroundImage: NetworkImage(data['photoUrl']),
              ),
            )

        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}