import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';

class JirankuAppBar extends StatelessWidget implements PreferredSizeWidget{

  //const JirankuAppBar({Key? key}) : super(key: key);
  // ignore: null_check_always_fails
  void _onPressLogoutButton() => _viewmodel.user = null;

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.exit_to_app),
                  title: new Text("Sign Out"),
                  onTap: () {
                    Navigator.pop(context);
                    _onPressLogoutButton();
                  },
                )
              ],
            ),
          );
        });
  }

  Size get preferredSize => Size.fromHeight(50.0);
  final String _title;
  final HomeViewmodel _viewmodel;
  //final IconButton _button;

  const JirankuAppBar({ title,viewmodel})
      :_title = title,
      _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      backgroundColor: Colors.grey[200],
          title: Text('Jiranku', style: TextStyle(fontFamily: "Kaushan", color: Colors.blueGrey[800], fontSize: 25.0, fontWeight: FontWeight.w500),),
      actions: [IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.blueGrey[800],
          ),
          onPressed: () =>  _settingModalBottomSheet(context)),]
    );
  }
}
