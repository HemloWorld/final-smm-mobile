import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/blocs/filter_date_page_bloc.dart';
import 'package:final_project/services/time_service.dart';
import 'package:final_project/widgets/list_page_widgets/search_by.dart';
import 'package:final_project/widgets/media_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FilterDatePage extends StatefulWidget {
  @override
  _FilterDatePageState createState() => _FilterDatePageState();
}

class _FilterDatePageState extends State<FilterDatePage> {
  DateTime _selectedDate;

  void _presentDatePicker(context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
          print(_selectedDate);
          print(pickedDate.toString());
          BlocProvider.of<FilterDatePageBloc>(context).add(SearchPresenceByDate(_selectedDate.toString()));
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

  List<DataRow> rowData(datas) {
    int index = 1;
    List<DataRow> _datas = [];
    datas.forEach((object) {
      _datas.add(DataRow(cells: [
        _cell('$index'),
        _cell(object['name']),
        _cell(object['time']),
      ]));
      index++;
    });

    return _datas;
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
            child: BlocProvider<FilterDatePageBloc>(
                create: (_) => FilterDatePageBloc(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: displayHeight(context) * 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Color(0xFFEBEEF1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 40.0,
                          width: displayWidth(context) * 80,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black45,
                              fontFamily: 'OpenSans',
                            ),
                            onTap: () {
                              _presentDatePicker(context);
                            },
                            readOnly: true,
                            onSubmitted: (input) {},
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  top: 6.0),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black45,
                                size: 20,
                              ),
                              hintText: _selectedDate == null
                                  ? TimeService().getDate().toString()
                                  : TimeService().beautifyDate(
                                  _selectedDate.toString()),
                              hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        SearchBy(
                          icon: Icons.calendar_today,
                          onPressed: () {
                            _presentDatePicker(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: displayHeight(context) * 2,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: displayWidth(context) * 3),
                      child: Text(
                        'Attendance report  ( ${_selectedDate == null
                            ? DateFormat.yMMMMEEEEd().format(
                            DateTime.now()) : DateFormat.yMMMMEEEEd()
                            .format(_selectedDate)} )',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(208, 52, 47, 1),
                            fontSize: 16),
                      ),
                    ),
                    BlocBuilder<FilterDatePageBloc, BlocState>(
                        builder: (context, state) {
                          if (state is Success) {
                            return Container(
                                child: Center(
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
                                        ],
                                        rows: rowData(state.result),
                                      )
                                  ),
                                )
                            );
                          }
                          if (state is Error) {
                            print('error');
                          }
                          return Column(
                            children: <Widget>[
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 3,
                              ),
                              Center(
                                  child: CircularProgressIndicator())
                            ],
                          );
                        }
                    ),
//                    Card(
//                     child: ListTile(
//                       leading: Ink.image(image: null),
//                       title: Text('nama'),
//                       subtitle: Text('jam'),
//                     ),
//                    )
                  ],
                )
            )
        ),
      );
    }
  }