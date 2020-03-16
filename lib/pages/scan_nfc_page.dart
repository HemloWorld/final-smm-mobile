import 'package:flutter/material.dart';
//pub dev
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;
//utils
import 'package:final_project/utils/pop_dialog.dart';
//widget
import 'package:final_project/widgets/main_button.dart';

class ScanNFCPage extends StatefulWidget {
  static String tag = 'scan-nfc-tag';
  @override
  _ScanNFCPageState createState() => _ScanNFCPageState();
}

class _ScanNFCPageState extends State<ScanNFCPage> {
  String scannerResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void scan() async {
    String result = await scanner.scan();
    setState(() {
      scannerResult = result;
      PopDialog.showBottomDialog(
        context,
        Center(
            child: Column(
              children: <Widget>[
                Text(scannerResult),
                MainButton(
                  text: 'Submit',
                  onClickEvent: () {
                    submit();
                  },
                ),
              ],
            )),

      );
    });}

  void submit() {
    setState(() {
      scannerResult = '';
    });
  }



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
                onPressed: () => scan(),
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
