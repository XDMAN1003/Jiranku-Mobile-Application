import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({name, gender, fullName, identity})
      : _name = name,
        _gender = gender,
        _fullName = fullName,
        _identity = identity;
  final String _name;
  final String _gender;
  final String _fullName;
  final String _identity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 20.0, 10, 20.0),
            child: ClipRRect(
              child: Opacity(
                  opacity: 0.95,
                  child: Image.asset(
                    "asset/card.png",
                    fit: BoxFit.fill,
                  )),
              borderRadius: BorderRadius.circular(16),
            ),
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
                color: Colors.blue[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 18,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(16)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0), //or 15.0
              child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width - 70.0,
                padding: EdgeInsets.fromLTRB(75, 8, 20, 0),
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$_name",
                      style: TextStyle(
                          fontFamily: "Acme",
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("$_fullName",
                        style: TextStyle(
                          fontFamily: "Acme",
                          fontSize: 12.0,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0), //or 15.0
              child: Container(
                height: 65.0,
                width: 65.0,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                color: Colors.amber,
                child: Image.asset((_gender == "Male")? "asset/man.png": "asset/woman.png" ),
              ),
            ),
          ),
          (_identity == "Admin") ? Positioned(
            child: Image(
              image: AssetImage("asset/crown.png"),
              width: 30.0,
            ),
            bottom: 10,
            right: 20,
          ): SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}
