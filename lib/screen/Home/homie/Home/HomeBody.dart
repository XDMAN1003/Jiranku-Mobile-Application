import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/NewsPost.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/ProductPost.dart';
import 'package:fyp_project_v2/screen/view.dart';
import 'package:intl/intl.dart';

import '../../MixHomeViewModel.dart';

class HomeBody extends StatelessWidget {
  //const HomeBody({ Key? key }) : super(key: key);
  final MixHomeScreenViewModel _viewmodel;
  HomeBody({viewmodel}) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print("Items:${_viewmodel.items}");
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0, 15.0, 20),
      color: Colors.white,
      child: View(
          progressBuilder: (context, viewmodel) => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator()),
              ),
          builder: (context, viewmodel, progressBuilder) {
            //List<dynamic> items = viewmodel.items;
            return ListView.separated(
                itemBuilder: (context, index) {
                  //viewmodel.getPostAuthor(viewmodel.news[index].postAuthorID);
                  final _hotSelling = Random().nextBool();
                  //print(items[index].runtimeType);
                  User _user =
                      viewmodel.getAuthor(viewmodel.items[index].postAuthorID);
                  // News _news = viewmodel.news[index];

                  final _difference = DateTime.now()
                      .difference(viewmodel.items[index].publishDateTime)
                      .inDays;
                  String formattedDate = DateFormat('dd-MM-yyyy kk:mm')
                      .format(viewmodel.items[index].publishDateTime);

                  return (viewmodel.items[index].runtimeType == News)
                      ? NewsPost(
                          appUser: viewmodel.user,
                          user: _user,
                          news: viewmodel.items[index],
                          screenHeight: screenHeight,
                          viewmodel: viewmodel,
                          difference: _difference,
                          index: index,
                        )
                      : ProductPost(
                          index: index,
                          user: _user,
                          screenHeight: screenHeight,
                          product: viewmodel.items[index],
                          viewmodel: viewmodel,
                          hotSelling: _hotSelling,
                          difference: _difference);
                },
                separatorBuilder: (context, index) => Divider(
                      color: Colors.blueGrey,
                    ),
                itemCount: viewmodel.items.length);
          },
          viewmodel: _viewmodel),
    );
  }
}
