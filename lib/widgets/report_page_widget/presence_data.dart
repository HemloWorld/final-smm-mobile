import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/blocs/profile_bloc.dart';
import 'package:final_project/services/time_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PresenceData extends StatefulWidget {
  final userId;
  PresenceData({@required this.userId});

  @override
  _PresenceDataState createState() => _PresenceDataState();
}

class _PresenceDataState extends State<PresenceData> {
  DataCell _cell(String text) {
    return DataCell(Text(text,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black45,
        )));
  }

  List<DataRow> rowData(datas) {
    int index = 1;
    List<DataRow> _datas = [];
    datas.forEach((object) {
      _datas.add(DataRow(cells: [
        _cell('$index'),
        _cell(TimeService().beautifyDate(object['date'])),
        _cell(object['time']),
        _cell('OK'),
      ]));
      index++;
    });

    return _datas;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 38),
              child: Text(
                '${DateFormat('MMMM').format(DateTime.now())} Report',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(208, 52, 47, 1),
                    fontSize: 16),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: BlocBuilder<ProfileBloc, BlocState>(
                  builder: (context, state) {
                    if (state is Waiting) {
                      BlocProvider.of<ProfileBloc>(context).add(
                          SearchPresenceByUserId(widget.userId, 0));
                    }
                    if (state is Success) {
                      return DataTable(
                        columnSpacing: 40,
                        dataRowHeight: 60,
                        columns: [
                          DataColumn(
                              label: Text(
                            "No",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.w900),
                          )),
                          DataColumn(
                              label: Text(
                            "Date",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.w900),
                          )),
                          DataColumn(
                              label: Text(
                            "Time",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.w900),
                          )),
                          DataColumn(
                              label: Text(
                            "Status",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.w900),
                          )),
                        ],
                        rows: rowData(state.result),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
