import 'package:flutter/material.dart';
import 'package:fyp_project_v2/app/dependencies.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';
import 'package:fyp_project_v2/screen/viewmodel.dart';
import 'package:fyp_project_v2/services/auth/auth_service.dart';
import 'package:fyp_project_v2/services/news/news_service.dart';

class NewsHomeScreenViewModel extends Viewmodel {
  final HomeViewmodel _homeViewmodel;
  
  NewsHomeScreenViewModel({homeViewmodel}) : _homeViewmodel = homeViewmodel {
    _loadHomeNews();
    _loadAllUsers();
  }

  NewService get service => dependency();
  AuthService get userService => dependency();
  bool _react1 = true;
  bool _react2 = true;
  bool _react3 = true;
  bool _react4 = true;

  set react1(val){
    turnBusy();
    _react1 = val;
    turnIdle();
  }
  get react1 => _react1;

  set react2(val){
    turnBusy();
    _react2 = val;
    turnIdle();
  }
  get react2 => _react2;

  set react3(val){
    turnBusy();
    _react3 = val;
    turnIdle();
  }
  get react3 => _react3;

  set react4(val){
    turnBusy();
    _react4 = val;
    turnIdle();
  }
  get react4 => _react4;

  List<User>? _usersList;
  get usersList => _usersList;
  void _loadAllUsers() => update(() async => _usersList = await userService.getAllUsers());

  User getAuthor(id) => usersList.firstWhere((element) => element.id == id);
  
  
  List<News>? _news;
  get news => _news;
  User? get user => _homeViewmodel.user;

  void _loadHomeNews() => update(() async => _news = await service.getNewsWithoutUser());
 
}