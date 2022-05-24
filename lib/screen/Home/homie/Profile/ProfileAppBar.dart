import 'package:flutter/material.dart';

import '../../HomeViewModel.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const ProfileAppBar({ Key? key }) : super(key: key);
  ProfileAppBar({viewmodel}) : _viewmodel = viewmodel;
  final HomeViewmodel _viewmodel;
  Size get preferredSize => Size.fromHeight(50.0);
  //final HomeViewmodel _viewmodel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
              fontFamily: "Acme",
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          (_viewmodel.user!.identity == "Admin")? IconButton(
            icon: Icon(
              Icons.add_moderator,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushNamed(context, '/addModerator'),
          ) : SizedBox(width: 0),          
          SizedBox(width: 5.0,),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushNamed(context, '/editProfile'),
          ),
          SizedBox(width: 10.0,)
        ]);
  }
}
