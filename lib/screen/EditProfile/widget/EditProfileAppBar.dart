import 'package:flutter/material.dart';

class EditProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const NewsAppBar({ Key? key }) : super(key: key);
   Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
       leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.white,
          title: Text('Edit Profile', style: TextStyle(fontFamily: "Acme",color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w500),),
    );
  }

}
