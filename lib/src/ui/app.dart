import 'package:flutter/material.dart';
import 'contact_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: ContactList(),
        ),
      );
  }
}