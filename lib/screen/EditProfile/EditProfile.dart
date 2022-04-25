import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title : Text('Edit Profile'),
                centerTitle : true,
                backgroundColor: Colors.deepOrange[300],
                elevation: 0.0,
                
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
      body: Text("Edit Profile"),
    );
  }
}