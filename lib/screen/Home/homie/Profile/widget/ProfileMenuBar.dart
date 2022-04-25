import 'package:flutter/material.dart';

class ProfileMenuBar extends StatelessWidget {
  const ProfileMenuBar({image, title, desc, length, onPress})
      : _image = image,
        _title = title,
        _desc = desc,
        _onPress = onPress,
        _length = length;
  final String _image;
  final String _title;
  final String _desc;
  final int _length;
  final void Function() _onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 10),
            side: BorderSide(color: Colors.black, width: 2),
          ),
          onPressed: _onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage("asset/menu/$_image"),
                width: 40.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$_title",
                      style: TextStyle(
                          fontFamily: "Acme",
                          color: Colors.black,
                          fontSize: 20.0),
                    ),
                    Text(
                      "$_desc",
                      style: TextStyle(
                          fontFamily: "Acme",
                          color: Colors.black,
                          fontSize: 15.0),
                    )
                  ],
                ),
              ),
              Text(
                _length.toString(),
                style: TextStyle(
                    fontFamily: "DG", color: Colors.black, fontSize: 45.0),
              )
            ],
          )),
    );
  }
}
