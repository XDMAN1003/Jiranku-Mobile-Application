import 'package:fyp_project_v2/models/news.dart';
import 'package:uuid/uuid.dart';

import 'news_service.dart';

class NewServiceMock implements NewService {
  Future<List<News>?>? getNewsByUser(dynamic postAuthorID) async{
    //News _news = _news_list.firstWhere((news_item) => news_item.postAuthorID == postAuthorID);
    List<News> _news = _news_list.where((element) => element.postAuthorID == postAuthorID).toList();
    return _news;
  }
  Future<News> updateNewsStatus(News news) async{
    //print(news.status);
    News _news = _news_list.firstWhere((element) => element.id == news.id);
    int index = _news_list.indexWhere((element) =>element.id == news.id );
    _news_list[index].description = news.description;
    _news_list[index].location = news.location;
    _news_list[index].photos = news.photos;
    _news_list[index].postAuthorID = news.postAuthorID;
    _news_list[index].id = news.id;
    //_news_list[index].publishDateTime = news.publishDateTime;
    _news_list[index].status = news.status;
    _news_list[index].reference = news.reference;    
    _news_list.forEach((element)=> print("${element.id} => ${element.status}"));
    return _news;
  }
  Future<News> addNews(News news) async{
    _news_list.add(news);
    return news;
  }

  Future<List<News>?>? getNewsWithoutUser() async{
    return _news_list;
  }
  Future<void> deleteNews(News news) async{
    _news_list.remove(news);
  }
}

List<News> _news_list = <News>[
  
  News(postAuthorID: "94eb65c1-1fd7-4e2d-aae5-ce5432681a9e", status: "Pending",id: Uuid().v1(),publishDateTime: DateTime(2022,4,1,20,30), location: "Taman Intan", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", photos: "sample.jpg"),
  News(postAuthorID: "94eb65c1-1fd7-4e2d-aae5-ce5432681a9e",status: "Pending",id: Uuid().v1(),publishDateTime: DateTime(2022,4,4,21,30),location: "Bandar Laguna Merbok", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", photos: "sample3.png"),
  News(postAuthorID: "94eb65c1-1fd7-4e2d-aae5-ce5432681a9e",status: "Pending",id: Uuid().v1(),publishDateTime: DateTime(2022,4,10,10,30),location: "Cinta Sayang", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.", photos: "sample7.jpg"),
];
