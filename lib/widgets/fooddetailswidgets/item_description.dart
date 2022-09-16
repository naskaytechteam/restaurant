import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../config/colors.dart';

class ItemDescription extends StatelessWidget {
  final String foodDesc;
  final bool readMore;
  final TapGestureRecognizer tapGestureRecognizer;

  const ItemDescription(
      {required this.readMore,
      required this.foodDesc,
      required this.tapGestureRecognizer,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      // height: height * 0.08,
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.01),
      // width: width,
      child: Text.rich(
        TextSpan(children: [
          //todo this logic can we be change
          TextSpan(
              text: readMore
                  ? foodDesc
                  : foodDesc.length > 140
                      ? foodDesc.substring(0, 140)
                      : foodDesc),
          if (foodDesc.length > 140)
            TextSpan(
              recognizer: tapGestureRecognizer,
              text: readMore ? 'Read Less' : '  Read more',
              style: const TextStyle(
                  color: orangeColor, fontWeight: FontWeight.bold),
            )
          else
            const TextSpan()
        ]),
        style: const TextStyle(fontSize: 15),
        // maxLines: 3,
        textAlign: TextAlign.start,
      ),
    );
  }
}
