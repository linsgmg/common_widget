import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class CheckBoxDemo2 extends StatefulWidget {
  @override
  _CheckBoxDemo2State createState() => _CheckBoxDemo2State();
}

class _CheckBoxDemo2State extends State<CheckBoxDemo2> {
  DateTime selectDateTime = DateTime.now();
  Future<String> _selectDateTime() async {
    final DateTime time = await showDatePicker(
        context: context,
        initialDate: selectDateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200));
    if (time == null) {
      return null;
    }
    setState(() {
      selectDateTime = time;
    });
  }

  TimeOfDay selectTime = TimeOfDay.now();
  Future<String> _selectTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (time == null) {
      return null;
    }
    setState(() {
      selectTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
        elevation: 3,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                _selectDateTime();
              },
              child: Row(
                children: <Widget>[
                  Text(
                    DateFormat.yMMMd().format(selectDateTime),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _selectTime();
              },
              child: Row(
                children: <Widget>[
                  Text(
                    selectTime.format(context),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
