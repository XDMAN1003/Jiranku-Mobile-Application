import 'package:fyp_project_v2/models/news.dart';

abstract class NewService {
  Future<List<News>?>? getNewsByUser(dynamic postAuthorID);
  Future<News> updateNewsStatus(News news);
  Future<News> addNews(News news);
  Future<List<News>?>? getNewsWithoutUser();
  Future<void> deleteNews(News news);
}

