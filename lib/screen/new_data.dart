import 'package:flutter/material.dart';

class Article{

  String title;
  String description;
  String urlToImage;
  DateTime publshedAt;

  Article({required this.title,required this.description,required this.publshedAt,
    required this.urlToImage});
}