import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScanNFCPage extends StatefulWidget {
  static String tag = 'scan-nfc-tag';
  @override
  _ScanNFCPageState createState() => _ScanNFCPageState();
}

class _ScanNFCPageState extends State<ScanNFCPage> {
  @override
  Widget _scanOrNFC(IconData icon, String label) {
    return Container(
      height: 120,
      width: 120,
      child: Card(
        color: Color(0xFFEBEEF1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(icon, color: Colors.black45, size: 50,),
            SizedBox(height: 10,),
            Text(label, style: TextStyle(color: Colors.black45, fontSize: 18))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: (){},
                child: Column(
                  children: <Widget>[
                    _scanOrNFC(Icons.settings_overscan,'SCAN QR')
                  ],
                ),
              ),
              FlatButton(
                onPressed: (){},
                child: Column(
                  children: <Widget>[
                    _scanOrNFC(Icons.nfc,"NFC")
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
