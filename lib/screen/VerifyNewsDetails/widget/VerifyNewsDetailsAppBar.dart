import 'package:flutter/material.dart';

class VerifyNewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const VerifyNewsAppBar({ Key? key }) : super(key: key);
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
      title: Text("Edit News", style: TextStyle(fontFamily: "Acme", fontSize: 25.0, color: Colors.black),),
    );
  }
}