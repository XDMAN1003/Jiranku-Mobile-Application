import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/screen/VerifyNewsDetails/widget/VerifyNewsDetailsAppBar.dart';
import 'package:fyp_project_v2/screen/VerifyNewsDetails/widget/VerifyNewsDetailsBody.dart';
class VerifyNewsDetails extends StatelessWidget {
  //const VerifyNewsDetails({ Key? key }) : super(key: key);
  final News _selectedNews;
  VerifyNewsDetails({selectedNews}): _selectedNews = selectedNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VerifyNewsAppBar(),
      body: VerifyNewsDetailsBody(news: _selectedNews,),
    );
  }
}