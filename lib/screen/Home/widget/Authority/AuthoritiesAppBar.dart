import 'package:flutter/material.dart';

class AuthoritiesAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const AuthoritiesAppBar({ Key? key }) : super(key: key);
   Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      backgroundColor: Colors.white,
          title: Text('Authorites', style: TextStyle(fontFamily: "Vol",color: Colors.blueGrey[800], fontSize: 25.0, fontWeight: FontWeight.w500),),
    );
  }

}
