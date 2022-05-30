import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/Home/NewsHomeViewModel.dart';
import 'package:fyp_project_v2/screen/VerifyNewsDetails/VerifyNewsDetails.dart';
import 'package:intl/intl.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({
    Key? key,
    required User appUser,
    required User user,
    required News news,
    required int index,
    required this.screenHeight,
    required dynamic viewmodel,
    required int difference,
  }) :_appUser = user, _index=index,_user = user, _news = news, _viewmodel = viewmodel, _difference = difference;

  final User _user;
  final User _appUser;
  final int _index;
  final News _news;
  final double screenHeight;
  final dynamic _viewmodel;
  final int _difference;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
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
                        onPressed: () async {
                          print("Username ${_appUser.fullName}");
                          print("Identity: ${_appUser.identity}");
                          if (_appUser.identity == "Admin") {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VerifyNewsDetails(
                                          selectedNews: _news,
                                        )));
                            if (result != null) {
                              Navigator.popAndPushNamed(
                                  context, "/home");
                              Navigator.pushNamed(
                                  context, "/verifyNewsList");
                            }
                          }
                          else{
                             ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        duration: const Duration(
                                            milliseconds: 500),
                                        content: Text(
                                            "Only admin can edit!")),
                                  );
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
              ),
              Container(
                width: double.infinity,
                height: 1 * screenHeight / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "asset/photos/" + _news.photos))),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => _viewmodel.react1 =
                                  !_viewmodel.react1,
                              icon: (_viewmodel.react1)
                                  ? Image.asset(
                                      "asset/react/hand.png")
                                  : Image.asset(
                                      "asset/react/hand-1.png")),
                          IconButton(
                              onPressed: () => _viewmodel.react2 =
                                  !_viewmodel.react2,
                              icon: (_viewmodel.react2)
                                  ? Image.asset(
                                      "asset/react/send.png")
                                  : Image.asset(
                                      "asset/react/send-1.png")),
                          IconButton(
                              onPressed: () => _viewmodel.react3 =
                                  !_viewmodel.react3,
                              icon: (_viewmodel.react3)
                                  ? Image.asset(
                                      "asset/react/talking.png")
                                  : Image.asset(
                                      "asset/react/talking-1.png")),
                        ],
                      ),
                      (_news.status == "Pending")
                          ? IconButton(
                              onPressed: () =>
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        duration: const Duration(
                                            milliseconds: 500),
                                        content: Text(
                                            "Waiting for the verification!")),
                                  ),
                              icon: Image.asset(
                                  "asset/react/wait.png"))
                          : (_news.status == "Fake News!!!")
                              ? IconButton(
                                  onPressed: () =>
                                      ScaffoldMessenger.of(
                                              context)
                                          .showSnackBar(
                                        SnackBar(
                                            duration:
                                                const Duration(
                                                    milliseconds:
                                                        500),
                                            content: Text(
                                                "Oh no! It is a fake news.")),
                                      ),
                                  icon: Image.asset(
                                      "asset/react/fake.png"))
                              : IconButton(
                                  onPressed: () =>
                                      ScaffoldMessenger.of(
                                              context)
                                          .showSnackBar(
                                        SnackBar(
                                            duration:
                                                const Duration(
                                                    milliseconds:
                                                        500),
                                            content: Text(
                                                "Great! It is a reliable news.")),
                                      ),
                                  icon: Image.asset(
                                      "asset/react/real.png"))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text("1023 likes | 1003 comments",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Acme",
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      _news.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Acme"),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      (_difference > 7)
                          ? "${DateFormat('MMMMd').format(_news.publishDateTime)} at ${DateFormat('Hm').format(_news.publishDateTime)} • ${_news.location}"
                          : "$_difference day(s) ago",
                      style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.blueGrey[500],
                          fontFamily: "Acme"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
