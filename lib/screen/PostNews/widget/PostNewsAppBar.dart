import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/PostNews/PostNewsViewModel.dart';
import 'package:uuid/uuid.dart';

class PostNewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const NewsAppBar({ Key? key }) : super(key: key);
  Size get preferredSize => Size.fromHeight(50.0);
  final PostNewsViewModel _viewmodel;
  PostNewsAppBar({viewmodel}) : _viewmodel = viewmodel;

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
      title: Text("Post News", style: TextStyle(fontFamily: "Acme", fontSize: 25.0, color: Colors.black),),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: IconButton(onPressed: ()=> print("Change to Post Product"), icon: Icon(Icons.shopping_bag, color: Colors.black,)),
        )
      ],
    );
  }
}
