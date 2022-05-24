import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/VerifyNewsList/widget/VerifyNewsListAppBar.dart';
import 'package:fyp_project_v2/screen/VerifyNewsList/widget/VerifyNewsListBody.dart';

class VerifyNewsList extends StatelessWidget {
  const VerifyNewsList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VerifyNewsListAppBar(),
      body: VerifyNewListBody(),
    );
  }
}