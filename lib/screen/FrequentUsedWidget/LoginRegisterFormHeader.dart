import 'package:flutter/material.dart';
import 'ParagraphText.dart';

class LoginRegisterFormHeader extends StatelessWidget {
  //const LoginRegisterFormHeader({ Key? key }) : super(key: key);

  final String _firstTitle;
  final String _secondTitle;

  LoginRegisterFormHeader({ firstTitle, secondTitle})
      : _firstTitle = firstTitle,
        _secondTitle = secondTitle;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          child: Text("$_firstTitle",
        style: TextStyle(
            color: Colors.grey[800],
            fontFamily: "Eczar",
            fontWeight: FontWeight.w900,
            fontSize: 55.0)),
          height: 80.0,
        ),
        ParagraphText(
          title: "$_secondTitle",
          size: 18.0,
        ),
        
      ],
    );
  }
}
