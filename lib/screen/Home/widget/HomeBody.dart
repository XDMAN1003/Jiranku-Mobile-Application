import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';
import 'package:fyp_project_v2/screen/Home/NewsHomeViewModel.dart';
import 'package:fyp_project_v2/screen/view.dart';
import 'package:intl/intl.dart';

class HomeBody extends StatelessWidget {
  //const HomeBody({ Key? key }) : super(key: key);
  final NewsHomeScreenViewModel _viewmodel;
  HomeBody({viewmodel}) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0, 15.0, 0),
      child: View(
          progressBuilder: (context, viewmodel) => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator()),
              ),
          builder: (context, viewmodel, progressBuilder) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  //viewmodel.getPostAuthor(viewmodel.news[index].postAuthorID);
                  User _user =
                      viewmodel.getAuthor(viewmodel.news[index].postAuthorID);
                  News _news = viewmodel.news[index];
                  final _difference =
                      DateTime.now().difference(_news.publishDateTime).inDays;
                  String formattedDate = DateFormat('dd-MM-yyyy kk:mm')
                      .format(_news.publishDateTime);
                  return Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      SingleChildScrollView(
                        child: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PostHeader(user: _user, news: _news),
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
                            PostFooter(
                                news: _news,
                                difference: _difference,
                                formattedDate: formattedDate),
                            (index == viewmodel.news.length - 1)
                                ? SizedBox(
                                    height: 20.0,
                                  )
                                : SizedBox(
                                    height: 0.0,
                                  )
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      color: Colors.blueGrey,
                    ),
                itemCount: viewmodel.news.length);
          },
          viewmodel: _viewmodel),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required User user,
    required News news,
  }) : _user = user, _news = news, super(key: key);

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

class PostFooter extends StatelessWidget {
  const PostFooter({
    Key? key,
    required News news,
    required int difference,
    required this.formattedDate,
  })   : _news = news,
        _difference = difference,
        super(key: key);

  final News _news;
  final int _difference;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_news.title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 5.0,
        ),
        Text(
          _news.description,
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.grey[800]),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          (_difference > 7)
              ? "Posted by ${formattedDate}"
              : "$_difference day(s) ago",
          style: TextStyle(fontSize: 10.0, color: Colors.blueGrey[500]),
        ),
      ],
    );
  }
}

