import 'package:fyp_project_v2/app/dependencies.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/services/news/news_service.dart';

import '../user_viewmodel.dart';
import '../viewmodel.dart';

class VerifyNewListViewModel extends Viewmodel {
  UserViewmodel get userViewmodel => dependency();
  NewService get _service => dependency();
  get user => userViewmodel.user;

  VerifyNewListViewModel(){
    loadHomeNews();
  }


  List<News>? _news;
  get news => _news;

  void loadHomeNews() => update(() async => _news = await _service.getNewsWithoutUser());
  

}