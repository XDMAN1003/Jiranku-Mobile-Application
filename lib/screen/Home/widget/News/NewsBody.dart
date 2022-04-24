import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/PostFooter.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/PostHeader.dart';
import 'package:intl/intl.dart';

import '../../../view.dart';
import '../../NewsHomeViewModel.dart';

class NewsBody extends StatelessWidget {
  NewsBody({viewmodel}): _viewmodel = viewmodel;
  final NewsHomeScreenViewModel _viewmodel;

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