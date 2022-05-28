import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/PostNews/widget/PostNewsAppBar.dart';

import 'widget/PostProductAppBar.dart';
import 'widget/PostProductBody.dart';
class PostProduct extends StatelessWidget {
  const PostProduct({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostProductAppBar(),
      body: PostProductBody(),
    );
  }
}