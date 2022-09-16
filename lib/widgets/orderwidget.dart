import 'package:flutter/material.dart';

import 'custom_elivated_button.dart';

class OrderWidget extends StatelessWidget {
  final String buttonText;
  final double? height;
  final EdgeInsets? containerPadding;
  final int price;

  const OrderWidget(
      {required this.buttonText, this.height,
        required this.price,
        this.containerPadding, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
        padding: containerPadding ?? const EdgeInsets.symmetric(horizontal: 22),
        height: this.height ?? height * 0.1,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height * 0.07,
              width: width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Price'),
                  Text(
                   '\$${ price.toString()}',
                    style:const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Color.fromRGBO(197, 48, 32, 1)),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              text: buttonText,
              buttonClick: () {},
              backgroundColor: Colors.black,
              buttonSize: Size(width * 0.55, height * .065),
            ),
          ],
        ));
  }
}
