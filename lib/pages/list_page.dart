import 'package:final_project/services/scan_service.dart';
import 'package:final_project/widgets/list_page_widgets/field_search_name.dart';
import 'package:final_project/widgets/list_page_widgets/search_by.dart';
import 'package:final_project/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:final_project/blocs/listpagebloc/lp_bloc.dart';

class ListPage extends StatelessWidget {
  static String tag = 'list-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // ini widget buat tombol yang disebelah search bar
                SearchBy(
                  icon: Icons.settings_overscan,
                  onPressed: () async {
                    String result = await ScanService().qr();
                    ListPageBloc().findById(result, 'qr', context);
                  },
                ),
                SearchBy(
                  icon: Icons.nfc,
                  onPressed: () async {
                    String result = await ScanService().nfc();
                    ListPageBloc().findById(result, 'nfc', context);
                  },
                ),
                FieldSearchName(),
              ],
            ),
            StreamBuilder(
              stream: ListPageBloc().subject$,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == 'loading') {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                        CircularProgressIndicator(),
                      ],
                    );
                  } else
                    return snapshot.data != 404
                        ? UserList(snapshot.data)
                        : Container(
                            // kalo ini jalan berarti data tidak ditemukan
                            // nanti ganti jadi gambar 404 error, sementara ini dulu
                            child: Center(
                              child: Text('404 user not found'), // ganti jadi sesuatu yang lain
                            ),
                          );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
