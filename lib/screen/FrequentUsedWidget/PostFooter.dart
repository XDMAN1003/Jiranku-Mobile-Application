import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({
    required News news,
    required int difference,
    required this.formattedDate,
  })   : _news = news,
        _difference = difference;

  final News _news;
  final int _difference;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_news.title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 5.0,
        ),
        Text(
          _news.description,
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.grey[800]),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          (_difference > 7)
              ? "Posted by ${formattedDate}"
              : "$_difference day(s) ago",
          style: TextStyle(fontSize: 10.0, color: Colors.blueGrey[500]),
        ),
      ],
    );
  }
}
