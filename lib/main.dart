import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:sheets_app_api/pages/home-page.dart';
import 'package:sheets_app_api/search.dart';
import 'package:sheets_app_api/utils/styling.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppTheme.primaryColorBlack,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}



