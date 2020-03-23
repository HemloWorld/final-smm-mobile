import 'package:final_project/services/time_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PresenceData extends StatefulWidget {
  final attendance;
  PresenceData({@required this.attendance});

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

  List<DataRow> rowData() {
    int index = 1;
    List<DataRow> _datas = [];
    widget.attendance.forEach((object) {
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
                child: DataTable(
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
                  rows: rowData(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
