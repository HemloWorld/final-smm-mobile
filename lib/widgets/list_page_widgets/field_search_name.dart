import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/list_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldSearchName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          width: 240,
          child: TextField(
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'OpenSans',
            ),
            onSubmitted: (input) {
              BlocProvider.of<ListPageBloc>(context).add(SearchUserById(input, 'name'));
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6.0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black45,
                size: 20,
              ),
              hintText: 'Search by name',
              hintStyle: TextStyle(color: Colors.black45, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
