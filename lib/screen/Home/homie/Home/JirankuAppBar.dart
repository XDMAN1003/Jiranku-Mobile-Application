import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';

class JirankuAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const JirankuAppBar({Key? key}) : super(key: key);
  // ignore: null_check_always_fails
  void _onPressLogoutButton() => _viewmodel.user = null;

  dynamic _share2Invite(context) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.zero,
                width: 400.0,
                child: Column(
                  children: [
                    Text(
                      "Invite New User",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Acme",
                          fontSize: 30.0),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Text(
                        "I am on Jiranku Application as @${_viewmodel.user!.username}. Install the app to know more about Sungai Petani.",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Acme",
                            fontSize: 20.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Invite via",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: "Acme",
                          fontSize: 15.0),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(milliseconds: 500),
                                  content: Text(
                                      'Redirecting... Send Invitation via SMS')));
                            },
                            icon: Image.asset("asset/profile/chat.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      content: Text(
                                          'Copy to clipboard successfully')));
                            },
                            icon: Image.asset("asset/profile/clipboard.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(milliseconds: 500),
                                  content: Text(
                                      'Redirecting... Send Invitation via Facebook')));
                            },
                            icon: Image.asset("asset/profile/facebook.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(milliseconds: 500),
                                  content: Text(
                                      'Redirecting... Send Invitation via Instagram')));
                            },
                            icon: Image.asset("asset/profile/instagram.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(milliseconds: 500),
                                  content: Text(
                                      'Redirecting... Send Invitation via WhatsApp')));
                            },
                            icon: Image.asset("asset/profile/whatsapp.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(milliseconds: 500),
                                  content: Text(
                                      'Redirecting... Send Invitation via Wechat')));
                            },
                            icon: Image.asset("asset/profile/wechat.png")),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                color: Colors.red,
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.disabled_by_default,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "CLOSE",
                        style: TextStyle(
                            fontFamily: "Acme",
                            fontSize: 20.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  void _settingModalBottomSheet(context, user) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.account_circle_outlined),
                    title: new Text('Edit Profile'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/editProfile');
                    }),
                new ListTile(
                  leading: new Icon(Icons.article_outlined),
                  title: new Text('Post News'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/addNews");
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.storefront_outlined),
                  title: new Text('Post Products'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/addProduct");
                  },
                ),
                new ListTile(
                    leading: new Icon(Icons.account_circle_outlined),
                    title: new Text('Invite New User'),
                    onTap: () {
                      Navigator.pop(context);
                      _share2Invite(context);
                    }),
                    (user.identity == "Admin") ? new ListTile(
                    leading: new Icon(Icons.verified_outlined),
                    title: new Text('Fake or Real News'),
                    onTap: () => Navigator.popAndPushNamed(context, '/verifyNewsList'),
                    ): SizedBox(height: 0.0,),
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
  final HomeViewmodel _viewmodel;
  //final IconButton _button;

  const JirankuAppBar({viewmodel}) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Jiranku',
          style: TextStyle(
              fontFamily: "Lobster",
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () => _settingModalBottomSheet(context, _viewmodel.user)),
        ]);
  }
}
