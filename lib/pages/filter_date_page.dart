import 'package:final_project/services/time_service.dart';
import 'package:final_project/widgets/list_page_widgets/search_by.dart';
import 'package:final_project/widgets/media_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterDatePage extends StatefulWidget {
  @override
  _FilterDatePageState createState() => _FilterDatePageState();
}

class _FilterDatePageState extends State<FilterDatePage> {
  DateTime _selectedDate;

  void _presentDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then((pickedDate){
      if (pickedDate==null){
        return;
      } else{
        setState(() {
          _selectedDate=pickedDate;
        });
      }
    });
  }

  DataCell _cell(String text) {
    return DataCell(Text(text,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black45,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: displayHeight(context) * 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color(0xFFEBEEF1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40.0,
                  width: displayWidth(context)*80,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'OpenSans',
                    ),
                    onTap: (){_presentDatePicker();},
                    readOnly: true,
                    onSubmitted: (input) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 6.0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black45,
                        size: 20,
                      ),
                      hintText: _selectedDate==null
                          ? TimeService().getDate().toString() : TimeService().beautifyDate(_selectedDate.toString()),
                      hintStyle: TextStyle(color: Colors.black45, fontSize: 16),
                    ),
                  ),
                ),
                SearchBy(
                  icon: Icons.calendar_today,
                  onPressed: () {_presentDatePicker();},
                ),
              ],
            ),
            SizedBox(
              height: displayHeight(context)*2,
            ),
            Container(
              padding: EdgeInsets.only(left: displayWidth(context)*3),
              child: Text(
                'Attendance report  ( ${_selectedDate==null
                    ? DateFormat.yMMMMEEEEd().format(DateTime.now()) : DateFormat.yMMMMEEEEd().format(_selectedDate)} )',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(208, 52, 47, 1),
                    fontSize: 16),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child : DataTable(
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
                                "Name",
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
                  rows: [
                    DataRow(
                        cells: [
                          _cell('1'),
                          _cell('Rio'),
                          _cell('12:00:00'),
                          _cell('OK'),
                        ]),
                    DataRow(
                        cells: [
                          _cell('2'),
                          _cell('Aris'),
                          _cell('12:00:00'),
                          _cell('OK'),
                        ]),
                    DataRow(
                        cells: [
                          _cell('3'),
                          _cell('Ruslan'),
                          _cell('12:00:00'),
                          _cell('OK'),
                        ]),
                    DataRow(
                        cells: [
                          _cell('4'),
                          _cell('Dennis'),
                          _cell('12:00:00'),
                          _cell('OK'),
                        ]),
                    DataRow(
                        cells: [
                          _cell('5'),
                          _cell('Afina'),
                          _cell('12:00:00'),
                          _cell('OK'),
                        ])
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

