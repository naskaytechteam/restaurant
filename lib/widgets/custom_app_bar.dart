import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget firstIcon;
  final Widget secondIcon;
  final String? centerText;
  final Widget? centerWidget;

  final VoidCallback firstIconClick;
  final VoidCallback secondIconClick;
  final double textSize;

  const CustomAppBar(
      {required this.firstIcon,
      required this.secondIcon,
      this.centerWidget,
      this.centerText,
      required this.firstIconClick,
      required this.secondIconClick,
        this.textSize=20,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Container(
      height: height * 0.1,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          shadowIcon(height, width, firstIcon, firstIconClick),
          centerText != null
              ? Text(centerText!,
                  style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.headline2?.fontFamily,
                      fontSize: textSize))
              : centerWidget!,
          shadowIcon(height, width, secondIcon, secondIconClick)
        ],
      ),
    );
  }

  Widget shadowIcon(
      double height, double width, Widget child, VoidCallback iconClick) {
    return InkWell(
      onTap: iconClick,
      child: Container(
        height: height * 0.06,
        width: width * 0.13,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: child,

      ),
    );
  }
}
