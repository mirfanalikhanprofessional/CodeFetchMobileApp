import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final bool softWrap;
  final int? maxLine;
  final TextDecoration textDecoration;
  final FontStyle fontStyle;

  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 12.0,
      this.fontWeight = FontWeight.w600,
      required this.color,
      this.textAlign = TextAlign.center,
      this.textOverflow = TextOverflow.visible,
      this.softWrap = false,
      this.maxLine,
      this.textDecoration = TextDecoration.none,
      this.fontStyle = FontStyle.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Mate',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration,
        fontStyle: fontStyle,
      ),
      softWrap: softWrap,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLine,
    );
  }
}
