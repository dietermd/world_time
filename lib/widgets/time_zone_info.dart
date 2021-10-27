import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeZoneInfo extends StatefulWidget {
  const TimeZoneInfo({Key? key, required this.dateTime}) : super(key: key);

  final DateTime dateTime;

  @override
  _TimeZoneInfoState createState() => _TimeZoneInfoState();
}

class _TimeZoneInfoState extends State<TimeZoneInfo> {
  DateTime _localDateTime = DateTime.now();
  Timer? _everySecond;
  final String _dateFormatLocale = 'en_US';
  int second = 0;

  @override
  void initState() {
    super.initState();
    _localDateTime = widget.dateTime;
    second = _localDateTime.second;
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      second++;
      if (second == 60) {
        second = 0;
        setState(() {
          _localDateTime = _localDateTime.add(Duration(minutes: 1));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(DateFormat(DateFormat.WEEKDAY, _dateFormatLocale).format(_localDateTime), style: TextStyle(fontSize: 20.0)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(DateFormat('yMMMMd', _dateFormatLocale).format(_localDateTime), style: TextStyle(fontSize: 30.0)),
            ),
            Text(DateFormat('HH:mm').format(_localDateTime), style: TextStyle(fontSize: 50.0))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _everySecond?.cancel();
  }
}