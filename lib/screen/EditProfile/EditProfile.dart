import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/EditProfile/widget/EditProfileAppBar.dart';
import 'package:fyp_project_v2/screen/EditProfile/widget/EditProfileBody.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditProfileAppBar(),
      body: EditProfileBody(),
    );
  }
}