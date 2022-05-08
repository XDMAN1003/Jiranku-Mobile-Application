import 'package:flutter/material.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const NewsAppBar({ Key? key }) : super(key: key);
   Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
          title: Text('News', style: TextStyle(fontFamily: "Acme",color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w500),),
    );
  }

}
