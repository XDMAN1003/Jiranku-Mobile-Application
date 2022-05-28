import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/product.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/ProductPost.dart';
import 'dart:math';
import 'package:fyp_project_v2/screen/Home/ProductHomeViewModel.dart';
import 'package:intl/intl.dart';

import '../../../view.dart';

class ProductBody extends StatelessWidget {
  //const ProductBody({ Key? key }) : super(key: key);
  final ProductHomeScreenViewModel _viewmodel;
  ProductBody({viewmodel}) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0, 15.0, 20.0),
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
                  final _hotSelling = Random().nextBool();
                  User _user = viewmodel
                      .getAuthor(viewmodel.products[index].postAuthorID);
                  Product _product = viewmodel.products[index];
                  final _difference = DateTime.now()
                      .difference(_product.publishDateTime)
                      .inDays;
                  String formattedDate = DateFormat('dd-MM-yyyy kk:mm')
                      .format(_product.publishDateTime);
                  return ProductPost(index: index,user: _user, screenHeight: screenHeight, product: _product, viewmodel: _viewmodel, hotSelling: _hotSelling, difference: _difference);
                },
                separatorBuilder: (context, index) => Divider(
                      color: Colors.blueGrey,
                    ),
                itemCount: viewmodel.products.length);
          },
          viewmodel: _viewmodel),
    );
  }
}
