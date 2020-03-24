import 'package:final_project/blocs/listpagebloc/lp_event.dart';
import 'package:final_project/blocs/listpagebloc/lp_state.dart';
import 'package:final_project/services/scan_service.dart';
import 'package:final_project/widgets/list_page_widgets/field_search_name.dart';
import 'package:final_project/widgets/list_page_widgets/search_by.dart';
import 'package:final_project/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:final_project/blocs/listpagebloc/lp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  static String tag = 'list-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider<ListPageBloc>(
          create: (_) => ListPageBloc(),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              BlocBuilder<ListPageBloc, ListPageState>(
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FieldSearchName(context.bloc<ListPageBloc>()),
                      // ini widget buat tombol yang disebelah search bar
                      SearchBy(
                        icon: Icons.settings_overscan,
                        onPressed: () async {
                          String result = await ScanService().qr();
                          context.bloc<ListPageBloc>().add(SearchByQrId(result));
                        },
                      ),
                      SearchBy(
                        icon: Icons.nfc,
                        onPressed: () async {
                          String result = await ScanService().nfc();
                          context.bloc<ListPageBloc>().add(SearchByNfcId(result));
                        },
                      ),
                    ],
                  );
                },
              ),
              BlocConsumer<ListPageBloc, ListPageState>(
                listener: (context, snapshot) {
                  return;
                },
                builder: (context, snapshot) {
                  if (snapshot is Loading) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                        CircularProgressIndicator(),
                      ],
                    );
                  } else if (snapshot is Success) {
                    return UserList((snapshot as Success).result);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
