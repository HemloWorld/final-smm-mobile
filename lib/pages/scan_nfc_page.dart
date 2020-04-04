import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/blocs/scan_nfc_page_bloc.dart';
import 'package:final_project/services/scan_service.dart';
import 'package:final_project/widgets/scan_nfc_page_widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScanNFCPage extends StatelessWidget {
  static String tag = 'scan-nfc-page';

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
            FaIcon(
              icon,
              color: Colors.black45,
              size: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(label, style: TextStyle(color: Colors.black45, fontSize: 18))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: BlocProvider<ScanNfcPageBloc>(
            create: (_) => ScanNfcPageBloc(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<ScanNfcPageBloc, BlocState>(
                    builder: (context, state){
                      if(state is Waiting){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () async {
                                String result = await ScanService().qr();
                                BlocProvider.of<ScanNfcPageBloc>(context)
                                    .add(SearchUserById(result, 'qr'));
                                print(result);
                              },
                              child: Column(
                                children: <Widget>[
                                  _scanOrNFC(FontAwesomeIcons.barcode, 'SCAN QR')
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () async {
                                String result = await ScanService().qr();
                                BlocProvider.of<ScanNfcPageBloc>(context)
                                    .add(SearchUserById(result, 'qr'));
                                print(result);
                              },
                              child: Column(
                                children: <Widget>[_scanOrNFC(Icons.nfc, "NFC")],
                              ),
                            )
                          ],
                        );
                      }
                      if(state is Success){
                        return CustomDialog(state.result);
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                )
              ],
            ),
          )
      ),
    );
  }
}

