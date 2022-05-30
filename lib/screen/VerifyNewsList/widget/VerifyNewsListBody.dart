import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/screen/VerifyNewsDetails/VerifyNewsDetails.dart';
import 'package:fyp_project_v2/screen/VerifyNewsList/VerifyNewListViewModel.dart';
import 'package:intl/intl.dart';

import '../../view.dart';

class VerifyNewListBody extends StatelessWidget {
  //const VerifyNewListBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: VerifyNewListViewModel(),
        progressBuilder: (context, viewmodel) => Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: CircularProgressIndicator()),
            ),
        builder: (context, viewmodel, progressBuilder) {
          // List<News> unverifiedNews =
          //     viewmodel.news.where((i) => i.status == "Pending").toList();
          List<News> unverifiedNews = viewmodel.news;
          return ListView.builder(
            itemCount: unverifiedNews.length,
            itemBuilder: (BuildContext context, int index) {
              int maxLengthDesc =
                  (unverifiedNews[index].description.length > 80)
                      ? 80
                      : unverifiedNews[index].description.length;

              print(index);
              return InkWell(
                onTap: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifyNewsDetails(
                                selectedNews: unverifiedNews[index],
                              )));
                  if (result != null) {
                    print(result);
                    print("Hhaha");
                    //viewmodel.loadHomeNews();
                    Navigator.pop(context);
                    //Navigator.pop(context);
                    Navigator.popAndPushNamed(context, "/home");
                    Navigator.pushNamed(context, "/verifyNewsList");
                  }
                },
                child: Column(
                  children: [
                    (index == 0)
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(
                            height: 0.0,
                          ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "asset/photos/${unverifiedNews[index].photos}"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Post #${index + 1}",
                                  style: TextStyle(
                                      fontFamily: "Acme",
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]),
                                ),
                                Text(
                                    "${unverifiedNews[index].description.substring(0, maxLengthDesc)} ...",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: "Acme",
                                        fontSize: 10.0,
                                        color: Colors.grey[800])),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "${DateFormat('MMMMd').format(unverifiedNews[index].publishDateTime)} at ${DateFormat('Hm').format(unverifiedNews[index].publishDateTime)} • ${unverifiedNews[index].location}",
                                  style: TextStyle(
                                      fontFamily: "Acme",
                                      fontSize: 8.0,
                                      color: Colors.blueGrey[500]),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          //List<String> news_status = ["Pending", "Verified", "Fake News!!!"];
                          (unverifiedNews[index].status == "Pending")
                              ? IconButton(
                                  onPressed: () => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.amber,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            content: Text(
                                                "Waiting for the verification!",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ),
                                  icon: Image.asset("asset/react/wait.png"))
                              : (unverifiedNews[index].status == "Fake News!!!")
                                  ? IconButton(
                                      onPressed: () =>
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                backgroundColor:
                                                    Colors.redAccent,
                                                duration: const Duration(
                                                    milliseconds: 600),
                                                content: Text(
                                                    "Oh no! It is FAKE.",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFFFFFFF0),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ),
                                      icon: Image.asset("asset/react/fake.png"))
                                  : IconButton(
                                      onPressed: () =>
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                content: Text(
                                                  "Great! It is a reliable news.",
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                      icon:
                                          Image.asset("asset/react/real.png")),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}

// ListTile(
//                 leading: Container(
//                   padding: EdgeInsets.zero,
//                   margin: EdgeInsets.zero,
//                   width: 60.0,
//                   height: 60.0,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage(
//                           "asset/photos/${unverifiedNews[index].photos}"),
//                     ),
//                   ),
//                 ),
//                 title: Text('Post #${index+1}'),
//                 onTap: () {
//                   final result = Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => VerifyNewsDetails(
//                                 selectedNews: unverifiedNews[index],
//                               )));
//                   if (result != null) {
//                     viewmodel.loadHomeNews();
//                   }
//                 },
//                 subtitle: Text(
//                     '${unverifiedNews[index].description.substring(0, 30)} ...'),
//                 trailing: Text("PENDING"),
//               )