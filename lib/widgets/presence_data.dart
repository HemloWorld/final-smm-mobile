import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PresenceData extends StatefulWidget {
  @override
  _PresenceDataState createState() => _PresenceDataState();
}

class _PresenceDataState extends State<PresenceData> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 38),
                child: Text(
                  '${DateFormat('MMMM').format(DateTime.now())} Report',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(208,52,47,1),
                      fontSize: 16
                  ),
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
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,fontWeight: FontWeight.w900),
                          )),
                      DataColumn(
                          label: Text(
                            "Date",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,fontWeight: FontWeight.w900),
                          )),
                      DataColumn(
                          label: Text(
                            "Time",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45, fontWeight: FontWeight.w900),
                          )),
                      DataColumn(
                          label: Text(
                            "Status",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45, fontWeight: FontWeight.w900),
                          )),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text("1",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("1 March 2020",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("09.30",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("Presence",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("1",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("1 March 2020",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("09.30",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("Presence",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("1",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("1 March 2020",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("09.30",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("Presence",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("1",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("1 March 2020",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("09.30",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("Presence",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("1",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("1 March 2020",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("09.30",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                        DataCell(Text("Presence",
                            style: TextStyle(fontSize: 16.0, color:Colors.black45,))),
                      ]),
                    ],
                  ),
                ),
              )
        ],
      ),
      ),
    );
  }
}
