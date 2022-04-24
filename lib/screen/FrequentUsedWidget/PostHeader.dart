import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/user.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    required User user,
    required News news,
  }) : _user = user, _news = news;

  final User _user;
  final News _news;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: (_user.gender == "Male")
                  ? AssetImage("asset/man.png")
                  : AssetImage("asset/woman.png"),
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  "${_user.username}",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                Text("${_user.identity}",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blueGrey[300])),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () =>
                  (_user.identity == "Admin")
                      ? print("Go to Auth News")
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Sorry, Only admin can authenticate the news. ')),
                        ),
              icon: Icon(Icons.verified),
              color: (_news.reference != "")
                  ? Colors.blueAccent
                  : Colors.blueGrey[100],
            ),
            IconButton(
                onPressed: () => print("Hello World"),
                icon: Icon(Icons.more_vert)),
          ],
        )
      ],
    );
  }
}