import 'package:flutter/material.dart';
import 'package:world_time/widgets/time_zone_list.dart';

class TimeZoneSearch extends SearchDelegate<String?> {
  final List<String> allTimeZones;

  TimeZoneSearch(this.allTimeZones);


  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () { query = ''; },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () { close(context, null); },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> results = allTimeZones.where((timeZone) => timeZone.toLowerCase().contains(query.toLowerCase())).toList();
    return timeZoneList(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = allTimeZones.where((timeZone) => timeZone.toLowerCase().contains(query.toLowerCase())).toList();
    return timeZoneList(context, suggestions);
  }
}