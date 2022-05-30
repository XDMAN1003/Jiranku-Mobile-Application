import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/PostNews/PostNewsViewModel.dart';
import 'package:uuid/uuid.dart';

import '../../view.dart';

class PostNewsBody extends StatelessWidget {
  //const PostNewsBody({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var uuid = Uuid();
  List<String> place = [
    "Taman Intan",
    "Bukit Bayan",
    "Cinta Sayang",
    "Taman Orkid",
    "Sungai Layar"
  ];
  List<String> place_icon = [
    "place/dimsum.png",
    "place/mountain.png",
    "place/resort.png",
    "place/stationery.png",
    "place/rice.png"
  ];

  List<String> news_status = ["Pending", "Verified", "Fake News!!!"];
  List<String> news_status_icon = [
    "react/wait.png",
    "react/real.png",
    "react/fake.png"
  ];

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

  Column _createList({context, viewmodel, items, images, label}) {
    List<ListTile> newList = [];
    for (var i = 0; i < items.length; i++) {
      newList.add(PlaceListTile(context,
          label: label,
          viewmodel: viewmodel,
          image: images[i],
          place: items[i]));
    }
    return new Column(
      children: newList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: PostNewsViewModel(),
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
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write Down Your Feeling",
                            ),
                            maxLines: 3,
                            onChanged: (value) => viewmodel.description = value,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(
                                        (viewmodel.photos == "") ? 0.0 : 1.0),
                                    BlendMode.dstATop),
                                image: (viewmodel.photos == "")
                                    ? AssetImage("asset/share.gif")
                                    : AssetImage(
                                        "asset/photos/${viewmodel.photos}"),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 50.0,
                                color: (viewmodel.photos == "")
                                    ? Colors.grey[600]
                                    : Colors.transparent,
                              ),
                              onPressed: () => _settingModalBottomSheet(context,
                                  viewmodel: viewmodel),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          PostNewFeature(context,
                              viewmodel: viewmodel,
                              feature: viewmodel.status,
                              list: news_status,
                              img_list: news_status_icon,
                              first_icon: Icons.verified_outlined,
                              second_icon: Icons.verified,
                              label: "News Status"),
                          PostNewFeature(context,
                              viewmodel: viewmodel,
                              feature: viewmodel.reference,
                              list: news_source,
                              img_list: news_source_icon,
                              first_icon: Icons.insert_link,
                              second_icon: Icons.link,
                              label: "News Source"),
                          PostNewFeature(context,
                              viewmodel: viewmodel,
                              feature: viewmodel.location,
                              first_icon: Icons.location_searching,
                              second_icon: Icons.my_location,
                              list: place,
                              img_list: place_icon,
                              label: "Location"),
                          SizedBox(
                            height: 10.0,
                          ),
                          //PostNewFeature(context, viewmodel: viewmodel, feature: viewmodel.location, label: "Location"),
                          //PostNewFeature(context, viewmodel: viewmodel, feature: viewmodel.location, label: "Location"),
                          MaterialButton(
                            padding: EdgeInsetsDirectional.all(15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () async {
                              if (viewmodel.description != "" &&
                                  viewmodel.photos != "") {
                                viewmodel.id = Uuid().v1();
                                dynamic result = await viewmodel.postNews();
                                if (result != null) {
                                  Navigator.pop(context);
                                  Navigator.popAndPushNamed(context, "/home");
                                }
                              } else {}
                            },
                            minWidth: double.infinity,
                            color: Colors.lightBlue,
                            child: Text(
                              "Post Now",
                              style: TextStyle(
                                  fontFamily: "Acme",
                                  fontSize: 25.0,
                                  color: Color(0XFFFFFFF0)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  InkWell PostNewFeature(context,
      {feature, label, viewmodel, list, img_list, first_icon, second_icon}) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  (feature == "") ? first_icon : second_icon,
                  color: (feature == "") ? Colors.grey[400] : Colors.grey[800],
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                (feature == "")
                    ? Text("$label",
                        style: TextStyle(
                          fontFamily: "Acme",
                          fontSize: 20.0,
                          color: Colors.grey[400],
                        ))
                    : Text("$feature",
                        style: TextStyle(
                          fontFamily: "Acme",
                          fontSize: 20.0,
                          color: Colors.grey[800],
                        )),
              ],
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: (feature == "") ? Colors.grey[400] : Colors.grey[800],
            )
          ],
        ),
      ),
      onTap: () => _showLocation(context,
          label: label, viewmodel: viewmodel, img_list: img_list, list: list),
    );
  }

  void _settingModalBottomSheet(context, {viewmodel}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: new Wrap(
              children: [
                Text(
                  "Gallery",
                  style: TextStyle(
                    fontFamily: "Acme",
                    fontSize: 25.0,
                    color: Colors.grey[800],
                  ),
                ),
                Divider(
                  color: Colors.grey[800],
                ),
                Row(
                  children: [
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample.jpg";
                        },
                        image: "sample.jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample2.png";
                        },
                        image: "sample2.png"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample3.png";
                        },
                        image: "sample3.png"),
                  ],
                ),
                Row(
                  children: [
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample4.jpg";
                        },
                        image: "sample4.jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample5.jpg";
                        },
                        image: "sample5.jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample6.jpg";
                        },
                        image: "sample6.jpg"),
                  ],
                ),
                Row(
                  children: [
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample7.jpg";
                        },
                        image: "sample7.jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample8.jpg";
                        },
                        image: "sample8.jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample9.jpg";
                        },
                        image: "sample9.jpg"),
                  ],
                ),
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  minWidth: double.infinity,
                  child: Text(
                    "CLOSE",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0XFFFFFFF0),
                        fontFamily: "Acme"),
                  ),
                  color: Colors.red[400],
                ),
              ],
            ),
          );
        });
  }

  void _showLocation(context, {viewmodel, list, img_list, label}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: new Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "$label",
                    style: TextStyle(
                      fontFamily: "Acme",
                      fontSize: 25.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[800],
                ),
                _createList(
                    label: label,
                    context: context,
                    viewmodel: viewmodel,
                    images: img_list,
                    items: list),
              ],
            ),
          );
        });
  }

  ListTile PlaceListTile(context, {label, viewmodel, image, place}) {
    return new ListTile(
        //leading: CircleAvatar(backgroundColor: Colors.lightBlue[200], backgroundImage: AssetImage("asset/place/dimsum.png")),
        leading: Image.asset(
          "asset/$image",
          width: 30.0,
        ),
        title: new Text("$place",
            style: TextStyle(
              fontFamily: "Acme",
              fontSize: 20.0,
            )),
        onTap: () {
          print(label);
          (label == "Location")
              ? viewmodel.location = "$place"
              : (label == "News Status")
                  ? viewmodel.status = "$place"
                  : viewmodel.reference = "$place";
          print(viewmodel.status);
          Navigator.pop(context);
        });
  }

  Padding GalleryImage({onTap, image}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 3.0, 2.0),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          width: 120.0,
          height: 110.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("asset/photos/$image"),
            ),
          ),
        ),
        onTap: onTap,
        hoverColor: Colors.grey[200],
      ),
    );
  }
}
