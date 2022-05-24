import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/PostNews/PostNewsViewModel.dart';

class VerifyNewsListAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const VerifyNewsListAppBar({ Key? key }) : super(key: key);

  Size get preferredSize => Size.fromHeight(50.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
       leading: IconButton(
        icon: Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text("Verify New List", style: TextStyle(fontFamily: "Acme", fontSize: 25.0, color: Colors.black),),
    );
  }
}