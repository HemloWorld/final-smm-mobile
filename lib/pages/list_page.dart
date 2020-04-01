import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/blocs/list_page_bloc.dart';
import 'package:final_project/services/scan_service.dart';
import 'package:final_project/widgets/list_page_widgets/field_search_name.dart';
import 'package:final_project/widgets/list_page_widgets/search_by.dart';
import 'package:final_project/widgets/user_list.dart';
import 'package:flutter/material.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FieldSearchName(),
                  SearchBy(
                    icon: Icons.settings_overscan,
                    onPressed: () async {
                      String result = await ScanService().qr();
                      BlocProvider.of<ListPageBloc>(context)
                          .add(SearchUserById(result, 'qr'));
                    },
                  ),
                  SearchBy(
                    icon: Icons.nfc,
                    onPressed: () async {
                      String result = await ScanService().nfc();
                      BlocProvider.of<ListPageBloc>(context)
                          .add(SearchUserById(result, 'nfc'));
                    },
                  ),
                ],
              ),
              BlocBuilder<ListPageBloc, BlocState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                        CircularProgressIndicator(),
                      ],
                    );
                  } else if (state is Success) {
                    return UserList(state.result);
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
