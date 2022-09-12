import 'package:flutter/material.dart';

import '../../config/colors.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      height: height * 0.08,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      width: width,
      // color: Colors.yellow,
      child: const Text.rich(
        TextSpan(children: [
          TextSpan(
              text: 'Lorem ipsum dolor'
                  ' sit amet. sonsectetur adipiscing '
                  'elit ut aliquam ,purus sit amet '
                  'luctus venenatis, lectus magna feingilla uma... '),
          TextSpan(
              text: 'Read more',
              style: TextStyle(color: orangeColor, fontWeight: FontWeight.bold))
        ]),
        style: TextStyle(fontSize: 15),
        maxLines: 3,
        textAlign: TextAlign.start,
      ),
    );
  }
}
