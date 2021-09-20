import 'package:flutter/material.dart';

class Article{

  String title;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String articleUrl;

  Article({required this.title,required this.articleUrl,required this.description,required this.publshedAt,
    required this.urlToImage});
}