import 'package:flutter/material.dart';
import 'package:world_time/screens/time_zone.dart';

Widget timeZoneList(BuildContext context, List<String> timeZones) {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  return ListView.separated(
      itemBuilder: (_, i) => ListTile(
            title: Text(timeZones[i], style: _biggerFont),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TimeZone(timeZone: timeZones[i])));
            },
          ),
      separatorBuilder: (_, __) => Divider(),
      itemCount: timeZones.length);
}
