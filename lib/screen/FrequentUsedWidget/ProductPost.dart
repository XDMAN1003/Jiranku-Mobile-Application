import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyp_project_v2/models/product.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:intl/intl.dart';

class ProductPost extends StatelessWidget {
  const ProductPost({
    Key? key,
    required User user,
    required this.screenHeight,
    required Product product,
    required dynamic viewmodel,
    required bool hotSelling,
    required int difference,
    required int index,
  })   : _index = index,
        _user = user,
        _product = product,
        _viewmodel = viewmodel,
        _hotSelling = hotSelling,
        _difference = difference,
        super(key: key);

  final User _user;
  final int _index;
  final double screenHeight;
  final Product _product;
  final dynamic _viewmodel;
  final bool _hotSelling;
  final int _difference;

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Image.asset("asset/profile/chat.png",width: 30.0,),
                  title: new Text("Chat with Business Owner", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... Chat with Business Owner'),),);
                  },
                ),
                new ListTile(
                  leading: new Image.asset("asset/profile/call.png",width: 30.0,),
                  title: new Text("Call with Business Owner", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... Call with Business Owner'),),);
                  },
                ),
                new ListTile(
                  leading: new Image.asset("asset/profile/wechat.png",width: 30.0,),
                  title: new Text("WeChat with Business Owner", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... WeChat with Business Owner'),),);
                  },
                ),
                new ListTile(
                  leading: new Image.asset("asset/profile/whatsapp.png",width: 30.0,),
                  title: new Text("WhatsApp with Business Owner", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                    duration: const Duration(milliseconds: 500),
                                    content: Text(
                                        'Redirecting... WhatsApp with Business Owner'),),);
                  },
                ),
                
          
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text("${_user.identity}",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.blueGrey[300])),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.deepOrange,
                                        duration: const Duration(
                                            milliseconds: 500),
                                        content: Row(
                                          children: [
                                            Image.asset("asset/crown.png", width: 20.0,),
                                            SizedBox(width: 10.0,),
                                            Text(
                                                "Verified Seller by Jiranku", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                          ],
                                        ))),

                          icon: Icon(
                            Icons.verified,
                            color: Colors.blue,
                          )),
                    ],
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 1 * screenHeight / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("asset/product/" + _product.photos))),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _product.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[800],
                          fontFamily: "Acme"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "RM ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.deepOrangeAccent,
                                  fontFamily: "Acme"),
                            ),
                            Text(
                              "${_product.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.deepOrangeAccent,
                                  fontFamily: "Acme"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _viewmodel.react4 = !_viewmodel.react4;
                                  _settingModalBottomSheet(context);
                                },
                                icon: (_viewmodel.react4)
                                    ? Image.asset("asset/react/handshake.png")
                                    : Image.asset(
                                        "asset/react/handshake-1.png")),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: (_product.stock < 50)
                              ? Colors.deepOrange
                              : Colors.blue[50],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Row(
                          children: [
                            (_product.stock < 50)
                                ? Icon(
                                    Icons.whatshot,
                                    color: Colors.white,
                                  )
                                : Icon(Icons.ac_unit_outlined),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              (_product.stock < 50)
                                  ? "Hot Selling Product!"
                                  : "More Product available!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: (_product.stock < 50)
                                      ? Colors.white
                                      : Colors.grey[800],
                                  fontFamily: "Acme"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      (_difference > 7)
                          ? "${DateFormat('MMMMd').format(_product.publishDateTime)} at ${DateFormat('Hm').format(_product.publishDateTime)} • ${_product.location}"
                          : "$_difference day(s) ago",
                      style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.blueGrey[500],
                          fontFamily: "Acme"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
