import 'package:flutter/material.dart';
import 'package:world_time/widgets/time_zone_list.dart';
import 'package:world_time/screens/time_zone_search.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.timeZones}) : super(key: key);
  final List<String> timeZones;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Time'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () { showSearch(context: context, delegate: TimeZoneSearch(timeZones)); }
          )
        ],
      ),
      body: timeZoneList(context, timeZones),
    );
  }
}