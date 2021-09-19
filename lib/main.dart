import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_24/screen/home.dart';
import 'dart:async';
import 'dart:convert';

import 'package:news_24/screen/newsfetch.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News_24',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
