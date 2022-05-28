import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/FormTextField.dart';
import 'package:fyp_project_v2/screen/PostNews/PostNewsViewModel.dart';
import 'package:fyp_project_v2/screen/PostProduct/PostProductViewModel.dart';
import 'package:uuid/uuid.dart';

import '../../view.dart';

class PostProductBody extends StatelessWidget {
  //const PostProductBody({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  List<String> place = [
    "Taman Intan",
    "Bukit Bayan",
    "Cinta Sayang",
    "Taman Orkid",
    "Sungai Layar"
  ];

  List<String> map = [
    "asset/map/2.png",
    "asset/map/3.png",
    "asset/map/4.png",
    "asset/map/6.png",
    "asset/map/5.png",
  ];

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
                          viewmodel.photos = "sample (1).jpg";
                        },
                        image: "sample (1).jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample (2).jpg";
                        },
                        image: "sample (2).jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample (3).jpg";
                        },
                        image: "sample (3).jpg"),
                  ],
                ),
                Row(
                  children: [
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample (4).jpg";
                        },
                        image: "sample (4).jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample (5).jpg";
                        },
                        image: "sample (5).jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample (6).jpg";
                        },
                        image: "sample (6).jpg"),
                  ],
                ),
                Row(
                  children: [
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample (7).jpg";
                        },
                        image: "sample (7).jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample (8).jpg";
                        },
                        image: "sample (8).jpg"),
                    GalleryImage(
                        onTap: () {
                          Navigator.pop(context);
                          viewmodel.photos = "sample (9).jpg";
                        },
                        image: "sample (9).jpg"),
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

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: PostProductViewModel(),
        progressBuilder: (context, viewmodel) => Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: CircularProgressIndicator()),
            ),
        builder: (context, viewmodel, progressBuilder) {
          User _user = viewmodel.user;
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: (_user.gender == "Male")
                                  ? AssetImage("asset/man.png")
                                  : AssetImage("asset/woman.png"),
                              backgroundColor: Colors.amber,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_user.username}",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("${_user.identity}",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.blueGrey[300])),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: (viewmodel.photos == "") ? 120 : 350.0,
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
                                      "asset/product/${viewmodel.photos}"),
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
                          height: 5.0,
                        ),
                        Text("Photo · Choose the best product photo. ",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[200])),
                        SizedBox(
                          height: 10.0,
                        ),
                        FormTextField(
                          label: "Product Title",
                          onChange: (val) => viewmodel.description = val,
                          validator: (val) => (val.length < 1)
                              ? "Enter a nice and sweet product title"
                              : null,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Price (MYR)",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (val) =>
                              viewmodel.price = double.parse(val),
                          validator: (val) => (val!.length < 1)
                              ? "Enter a reliable price in MYR"
                              : null,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Stock',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (val) => viewmodel.stock = int.parse(val),
                          validator: (val) => (val!.length < 1)
                              ? "Enter the amount of the stock"
                              : null,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildDropDown(
                            label: "Location",
                            initialValue: place[0],
                            items: place,
                            onChanged: (val) {
                              viewmodel.location = val;
                              int index = place.indexWhere(
                                  (element) => element == viewmodel.location);
                              //print(index);
                              viewmodel.map = map[index];
                              print(viewmodel.map);
                              print(viewmodel.location);
                            }),
                        //Text("${viewmodel.stock}"),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage((viewmodel.map == "")
                                  ? "asset/map/2.png"
                                  : viewmodel.map),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UpdateCancelButton(
                                context: context,
                                label: "Post",
                                onPress: () async {
                                  if (viewmodel.description != "" &&
                                      viewmodel.photos != "") {
                                    viewmodel.postID = Uuid().v1();
                                    dynamic result =
                                        await viewmodel.postProduct();
                                    if (result != null) {
                                      Navigator.pop(context);
                                      Navigator.popAndPushNamed(
                                          context, "/home");
                                    }
                                  }
                                },
                                color: Colors.greenAccent),
                            UpdateCancelButton(
                                context: context,
                                label: "Cancel",
                                onPress: () => Navigator.pop(context),
                                color: Colors.redAccent)
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          );
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
              image: AssetImage("asset/product/$image"),
            ),
          ),
        ),
        onTap: onTap,
        hoverColor: Colors.grey[200],
      ),
    );
  }

  DropdownButtonFormField _buildDropDown(
      {label, items, onChanged, initialValue}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      value: initialValue,
      items: items.map<DropdownMenuItem>((item) {
        return DropdownMenuItem(
          child: Text('${item}'),
          value: item,
        );
      }).toList(),
      validator: (val) => (val == null) ? "$label must be selected" : null,
      onChanged: onChanged,
    );
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
