import 'package:fyp_project_v2/models/news.dart';

import '../../app/dependencies.dart';
import '../rest.dart';
import 'news_service.dart';

class NewServiceRest implements NewService{
  RestService get rest => dependency();

  Future<List<News>?>? getNewsByUser(dynamic postAuthorID) async {
    final listJson = await rest.get('news/${postAuthorID}');
    return (listJson as List)
        .map((itemJson) => News.fromJson(itemJson))
        .toList();
  }

  Future<News> updateNewsStatus(News news) async{
    final json = await rest.patch('news/${news.postID}',data: news);
    return News.fromJson(json);
  }

  Future<News> addNews(News news) async{
    final json = await rest.post('news', data: news); 
    return News.fromJson(json);
  }

  Future<List<News>?>? getNewsWithoutUser() async{
    final listJson = await rest.get('news');
    return (listJson as List)
        .map((itemJson) => News.fromJson(itemJson))
        .toList();
  }

  Future<void> deleteNews(News news) async{
    await rest.delete('news/${news.postID}');
  }
}
