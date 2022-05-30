import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/NewsPost.dart';
import 'package:fyp_project_v2/screen/VerifyNewsDetails/VerifyNewsDetails.dart';
import 'package:intl/intl.dart';
import '../../../view.dart';
import '../../NewsHomeViewModel.dart';

class NewsBody extends StatelessWidget {
  NewsBody({viewmodel}) : _viewmodel = viewmodel;
  final NewsHomeScreenViewModel _viewmodel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    //print("Update the News");
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0, 15.0,20.0),
      child: View(
          progressBuilder: (context, viewmodel) => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator()),
              ),
          builder: (context, viewmodel, progressBuilder) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    //viewmodel.getPostAuthor(viewmodel.news[index].postAuthorID);
                    User _user =
                        viewmodel.getAuthor(viewmodel.news[index].postAuthorID);
                    News _news = viewmodel.news[index];
                    final _difference =
                        DateTime.now().difference(_news.publishDateTime).inDays;
                    String formattedDate = DateFormat('dd-MM-yyyy kk:mm')
                        .format(_news.publishDateTime);
                    return NewsPost(appUser: viewmodel.user, user: _user, news: _news, screenHeight: screenHeight, viewmodel: _viewmodel, difference: _difference, index: index,);
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.blueGrey,
                      ),
                  itemCount: viewmodel.news.length),
            );
          },
          viewmodel: _viewmodel),
    );
  }
}

