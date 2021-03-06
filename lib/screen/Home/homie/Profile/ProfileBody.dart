import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';
import 'widget/ProfileCard.dart';
import 'widget/ProfileMenuBar.dart';

class ProfileBody extends StatelessWidget {
  //const ProfileBody({ Key? key }) : super(key: key);
  HomeViewmodel _viewmodel;
  ProfileBody({viewmodel}) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          SizedBox(
            height: 25.0,
          ),
          ProfileCard(
            name: _viewmodel.user!.username,
            fullName: _viewmodel.user!.fullName,
            gender: _viewmodel.user!.gender,
            identity: _viewmodel.user!.identity,
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "Profile Details",
            style: TextStyle(fontFamily: "Acme", fontSize: 20.0),
          ),
          ProfileMenuBar(
            image: "news.png",
            title: "Posted News",
            desc: "Click to check posted news",
            length: 10,
            onPress: () => _showComingSoon(context),
          ),
          (_viewmodel.user!.identity == "Admin")
              ? ProfileMenuBar(
                  image: "verify.png",
                  title: "Pending News",
                  desc: "Click to check unverified news",
                  length: 3,
                  onPress: () => Navigator.pushNamed(context, '/verifyNewsList'),
                )
              : SizedBox(
                  height: 0.0,
                ),
          ProfileMenuBar(
            image: "sale.png",
            title: "Posted Sales",
            desc: "Click to check posted product",
            length: 10,
            onPress: () => _showComingSoon(context),
          ),
          ProfileMenuBar(
            image: "invitation.png",
            title: "Invite New User",
            desc: "Click to invite new users",
            length: 0,
            onPress: () => _share2Invite(context),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Designed by Jiranku",
            style: TextStyle(
                fontFamily: "Acme", fontSize: 15.0, color: Colors.black45),
          ),
        ]),
      ),
    );
  }

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
                              Navigator.pop(context); ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... Send Invitation via SMS')));},
                            icon: Image.asset("asset/profile/chat.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context); ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Copy to clipboard successfully')));},
                            icon: Image.asset("asset/profile/clipboard.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context); ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... Send Invitation via Facebook')));},
                            icon: Image.asset("asset/profile/facebook.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context); ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... Send Invitation via Instagram')));},
                            icon: Image.asset("asset/profile/instagram.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context); ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... Send Invitation via WhatsApp')));},
                            icon: Image.asset("asset/profile/whatsapp.png")),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context); ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... Send Invitation via Wechat')));},
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

  dynamic _showComingSoon(context, {type, link}) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                width: 400.0,
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("asset/coming_soon.gif"),
                  ),
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
                        Icons.cancel_presentation,
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
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
}
