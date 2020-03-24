import 'package:final_project/blocs/listpagebloc/lp_bloc.dart';
import 'package:final_project/blocs/listpagebloc/lp_event.dart';
import 'package:final_project/blocs/listpagebloc/lp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldSearchName extends StatelessWidget {
  final bloc;
  FieldSearchName(this.bloc);
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
              bloc.add(SearchByName(input));
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
