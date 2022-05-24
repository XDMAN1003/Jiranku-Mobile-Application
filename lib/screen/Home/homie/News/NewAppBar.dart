import 'package:flutter/material.dart';

import '../../HomeViewModel.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const NewsAppBar({ Key? key }) : super(key: key);
   Size get preferredSize => Size.fromHeight(50.0);
  NewsAppBar({viewmodel}) : _viewmodel = viewmodel;
  final HomeViewmodel _viewmodel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
       actions: [
          (_viewmodel.user!.identity == "Admin")? IconButton(
            icon: Icon(
              Icons.dangerous,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushNamed(context, '/verifyNewsList'),
          ) : SizedBox(width: 0),          
          SizedBox(width: 5.0,),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushNamed(context, '/addNews'),
          ),
          SizedBox(width: 10.0,)
        ],
      backgroundColor: Colors.white,
          title: Text('News', style: TextStyle(fontFamily: "Acme",color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w500),),
    );
  }

}
