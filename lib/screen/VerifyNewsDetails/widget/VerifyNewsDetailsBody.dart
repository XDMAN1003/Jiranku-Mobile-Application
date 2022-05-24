import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/screen/VerifyNewsDetails/VerifyNewsDetailsViewModel.dart';
import 'package:intl/intl.dart';

import '../../view.dart';

class VerifyNewsDetailsBody extends StatelessWidget {
  //const VerifyNewsDetailsBody({ Key? key }) : super(key: key);
  News _news;
  VerifyNewsDetailsBody({news}) : _news = news;

  List<String> news_source = [
    "Astro Awani",
    "Berita Harian",
    "Metro Harian",
    "Sinchew Daily",
    "The Star",
    "New Strait Times",
    "Others"
  ];
  List<String> news_source_icon = [
    "source/Awani.png",
    "source/BH.png",
    "source/metro.png",
    "source/Sinchew.png",
    "source/Star.png",
    "source/NST.png",
    "source/warning.png"
  ];
  List<String> news_status = ["Pending", "Verified", "Fake News!!!"];

  Column _createList({context, viewmodel, items, images,news}) {
    List<ListTile> newList = [];
    for (var i = 0; i < items.length; i++) {
      newList.add(new ListTile(
          //leading: CircleAvatar(backgroundColor: Colors.lightBlue[200], backgroundImage: AssetImage("asset/place/dimsum.png")),
          leading: Image.asset(
            "asset/${images[i]}",
            width: 30.0,
          ),
          title: new Text("${items[i]}",
              style: TextStyle(
                fontFamily: "Acme",
                fontSize: 20.0,
              )),
          onTap: () {
            viewmodel.reference = "${items[i]}";
            //print(viewmodel.status);
            _onUpdateNewsDetails(context,viewmodel,news);
            Navigator.pop(context);
          }));
    }
    return new Column(
      children: newList,
    );
  }

   void _showNewsStatus(context, {viewmodel, list, img_list,label,news}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "$label",
                    style: TextStyle(
                      fontFamily: "Acme",
                      fontSize: 20.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[800],
                ),
                _createList(
                    context: context,
                    viewmodel: viewmodel,
                    images: img_list,
                    news: news,
                    items: list),
              ],
            ),
          );
        });
  }

  void _onUpdateNewsDetails(BuildContext context, VerifyNewsDetailsViewModel viewmodel, News news) async {
    viewmodel.postID = news.postID;
    viewmodel.postAuthorID = news.postAuthorID;
    viewmodel.photos = news.photos;
    viewmodel.description = news.description;
    viewmodel.location = news.location;

    final News? _news = await viewmodel.updateNews();
    if (_news != null) {
      Navigator.pop(context,_news);
      //Navigator.pop(context);
      //Navigator.popAndPushNamed(context, "/home");
    }
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return View(
        viewmodel: VerifyNewsDetailsViewModel(),
        progressBuilder: (context, viewmodel) => Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: CircularProgressIndicator()),
            ),
        builder: (context, viewmodel, progressBuilder) {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 1 * screenHeight / 3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("asset/photos/" + _news.photos))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      _news.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[800],
                          fontFamily: "Acme"),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${DateFormat('MMMMd').format(_news.publishDateTime)} at ${DateFormat('Hm').format(_news.publishDateTime)} • ${_news.location}",
                          style: TextStyle(
                              fontFamily: "Acme",
                              fontSize: 12.0,
                              color: Colors.blueGrey[500]),
                        ),
                        Text("Uploaded by ${_news.postAuthorID}",
                            style: TextStyle(
                                fontFamily: "Acme",
                                fontSize: 12.0,
                                color: Colors.blueGrey[500]))
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UpdateCancelButton(
                            context: context,
                            label: "RELIABLE!",
                            onPress: () {
                              viewmodel.status = news_status[1];
                              _showNewsStatus(context, viewmodel: viewmodel, img_list: news_source_icon, list: news_source, label: "Reliable News (Reference)", news: _news );
                              //_onUpdateNewsDetails(context,viewmodel,_news);
                            },
                            color: Colors.greenAccent),
                        UpdateCancelButton(
                            context: context,
                            label: "FAKE!",
                            onPress: () {
                              viewmodel.status = news_status[2];
                              _showNewsStatus(context, viewmodel: viewmodel, img_list: news_source_icon, list: news_source, label: "Fake News (Reference)", news: _news );
                            },
                            color: Colors.redAccent)
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    MaterialButton(
                        height: 60.0,
                        minWidth: double.infinity,
                        onPressed: () => Navigator.pop(context),
                        color: Colors.amber,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "CANCEL",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey[800],
                              fontFamily: "Acme"),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  MaterialButton UpdateCancelButton({context, label, onPress, color}) {
    return MaterialButton(
        height: 60.0,
        minWidth: (MediaQuery.of(context).size.width - 50.0) / 2,
        onPressed: onPress,
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          "$label",
          style: TextStyle(
              fontSize: 20.0, color: Colors.grey[800], fontFamily: "Acme"),
        ));
  }
}
