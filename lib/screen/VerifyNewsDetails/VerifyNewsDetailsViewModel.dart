import 'package:fyp_project_v2/app/dependencies.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/screen/user_viewmodel.dart';
import 'package:fyp_project_v2/screen/viewmodel.dart';
import 'package:fyp_project_v2/services/news/news_service.dart';

class VerifyNewsDetailsViewModel extends Viewmodel{
  UserViewmodel get userViewmodel => dependency();
  NewService get _service => dependency();
  get user => userViewmodel.user;
  News _news = News();

  get postID => _news.postID;
  set postID(value) {
    turnBusy();
    _news.postID = value;
    turnIdle();
  }

  get location => _news.location;
  set location(value) {
    turnBusy();
    _news.location = value;
    turnIdle();
  }

    get postAuthorID => _news.postAuthorID;
  set postAuthorID(value) {
    turnBusy();
    _news.postAuthorID = value;
    turnIdle();
  }

    get description => _news.description;
  set description(value) {
    turnBusy();
    _news.description = value;
    turnIdle();
  }

  get photos => _news.photos;
  set photos(value) {
    turnBusy();
    _news.photos = value;
    turnIdle();
  }

  get reference => _news.reference;
  set reference(value) {
    turnBusy();
    _news.reference = value;
    turnIdle();
  }
  
  get status => _news.status;
  set status(value) {
    turnBusy();
    _news.status = value;
    turnIdle();
  }

   Future<News?> updateNews() async {
    turnBusy();
    final News? _result = await _service.updateNewsStatus(_news);
    turnIdle();
    return _result;
  }


}