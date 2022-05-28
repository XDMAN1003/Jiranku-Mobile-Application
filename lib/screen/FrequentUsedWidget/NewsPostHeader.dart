import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/VerifyNewsDetails/VerifyNewsDetails.dart';

class NewPostHeader extends StatelessWidget {
  const NewPostHeader({
    required User user,
    required News news,
  })   : _user = user,
        _news = news;

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${_user.username}",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Text("${_user.identity}",
                    style:
                        TextStyle(fontSize: 12.0, color: Colors.blueGrey[300])),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () async {
                if (_user.identity == "Admin") {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifyNewsDetails(
                                selectedNews: _news,
                              )));
                  if (result != null) {
                    Navigator.popAndPushNamed(context, "/home");
                    Navigator.pushNamed(context, "/verifyNewsList");
                  }
                }
              },
              icon: Icon(Icons.verified),
              color: (_news.reference != "")
                  ? Colors.blueAccent
                  : Colors.blueGrey[100],
            ),
          ],
        )
      ],
    );
  }
}
