import 'package:flutter/material.dart';

import '../../HomeViewModel.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const ProductAppBar({ Key? key }) : super(key: key);
   Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
       actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushNamed(context, '/addProduct'),
          ),
          SizedBox(width: 10.0,)
        ],
      backgroundColor: Colors.white,
          title: Text('Product', style: TextStyle(fontFamily: "Acme",color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w500),),
    );
  }

}
