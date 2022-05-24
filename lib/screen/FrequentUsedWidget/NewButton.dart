import 'package:flutter/material.dart';
import 'package:fyp_project_v2/screen/FrequentUsedWidget/ParagraphText.dart';

class NewButton extends StatelessWidget {
  //const NewButton({ Key? key }) : super(key: key);
  NewButton({label, onPress})
      : _label = label,
        _onPress = onPress;
  final String _label;
  final VoidCallback _onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: _onPress,
      color: Color(0xFF3ABFC9),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ParagraphText(title: _label.toUpperCase(),size: 20.0, color: Color(0XFFFFFFF0),)
    );
  }
}
