import 'package:flutter/material.dart';

class ParagraphText extends StatelessWidget {
  //const ParagraphText({ Key? key }) : super(key: key);
  ParagraphText({title, size, color = const Color(0xFF757575)})
      : _title = title,
        _color = color,
        _size = size;
  final double _size;
  final String _title;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_title",
      style: TextStyle(
          color: _color, 
          fontFamily: "Eczar", 
          fontWeight: FontWeight.w600,
          fontSize: _size,
          letterSpacing: 1,
          ),
    );
  }
}
