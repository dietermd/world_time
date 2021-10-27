import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:world_time/screens/splash.dart';
import 'package:world_time/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: _getTimeZones(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            theme: ThemeData(primaryColor: Colors.blue),
            home: Home(timeZones: snapshot.data),
          );
        }
      },
    );
  }

  Future<List<String>> _getTimeZones() async {
    final response =
        await http.get(Uri.parse('http://worldtimeapi.org/api/timezone'));
    if (response.statusCode == 200) {
      return new List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load timezones');
    }
  }
}
