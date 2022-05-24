import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/PostNews/PostNewsViewModel.dart';
import 'package:fyp_project_v2/screen/PostNews/widget/PostNewsAppBar.dart';
import 'widget/PostNewsBody.dart';

class PostNews extends StatelessWidget {
  const PostNews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostNewsAppBar(viewmodel: PostNewsViewModel(),),
      body: PostNewsBody(),
    );
  }
}