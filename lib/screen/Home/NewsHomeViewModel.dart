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

  List<User>? _usersList;
  get usersList => _usersList;
  void _loadAllUsers() => update(() async => _usersList = await userService.getAllUsers());

  User getAuthor(userID) => usersList.firstWhere((element) => element.userID == userID);
  
  
  List<News>? _news;
  get news => _news;
  User? get user => _homeViewmodel.user;

  void _loadHomeNews() => update(() async => _news = await service.getNewsWithoutUser());
 
}