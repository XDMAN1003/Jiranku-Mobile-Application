import 'package:fyp_project_v2/app/dependencies.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/screen/viewmodel.dart';
import 'package:uuid/uuid.dart';
import 'package:fyp_project_v2/services/news/news_service.dart';

import '../user_viewmodel.dart';

class PostNewsViewModel extends Viewmodel {
  UserViewmodel get userViewmodel => dependency();
  NewService get _service => dependency();
  get user => userViewmodel.user;
  News _post = News();

  set description(val) {
    turnBusy();
    _post.description = val;
    turnIdle();
  }

  get description => _post.description;

  set status(val) {
    turnBusy();
    _post.status = val;
    turnIdle();
  }
  get status => _post.status;

  set postID(val) {
    turnBusy();
    _post.postID = val;
    turnIdle();
  }
  get postID => _post.postID;

  set photos(val) {
    turnBusy();
    _post.photos = val;
    turnIdle();
  }

  get photos => _post.photos;

  set reference(val) {
    turnBusy();
    _post.reference = val;
    turnIdle();
  }

  get reference => _post.reference;

  set location(val) {
    turnBusy();
    _post.location = val;
    turnIdle();
  }
  get location => _post.location;

  Future<News?> postNews() async {
    _post.postAuthorID = user.userID;
    _post.publishDateTime = new DateTime.now();
    //_post.postID = uuid.v1();
    turnBusy();
    //final User? _result = await _service.registration(user: _user);
    final News _result = await _service.addNews(_post);
    // if (_result != null) {
    //   _user = _result;
    // }
    turnIdle();
    return _result;
  }

  // String _postID;
  // String _postAuthorID;
  // String _title;
  // String _description;
  // String _status;
  // String _photos;
  // String _reference;
  // DateTime? _publishDateTime;

}
