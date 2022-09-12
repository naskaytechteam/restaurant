import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback buttonClick;
  final String? fontFamily;
  final Size? buttonSize;
  final double? fontSize;

  const CustomElevatedButton(
      {required this.text,
      required this.buttonClick,
      this.textColor,
      this.fontFamily,
      this.buttonSize,
      this.fontSize,
      this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return ElevatedButton(
      onPressed: buttonClick,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        elevation: 0,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: buttonSize ?? Size(width, height * 0.06),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 17,
          color: textColor,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
