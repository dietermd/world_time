import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:world_time/widgets/time_zone_info.dart';

class TimeZone extends StatelessWidget {
  const TimeZone({Key? key, required this.timeZone}) : super(key: key);
  final String timeZone;

  @override
  Widget build(BuildContext context) {
    _getTimezoneInfo(this.timeZone);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.timeZone),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _getTimezoneInfo(this.timeZone),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator(value: null);
          } else {
            return TimeZoneInfo(dateTime: snapshot.data as DateTime);
          }
        },
      ),
    );
  }

  Future<DateTime> _getTimezoneInfo(String timezone) async {
    final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/' + timeZone));
    if (response.statusCode == 200) {
      final _map = jsonDecode(response.body);
      final String _utcDateTime = _map['datetime'];
      return DateTime.parse(_utcDateTime.substring(0, _utcDateTime.length - 6));
    } else {
      throw Exception('Failed to load timezone info');
    }
  }
}