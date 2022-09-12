import 'package:flutter/material.dart';

class OrderPrice extends StatelessWidget {
  const OrderPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Align(
      child: SizedBox(
        height: height * 0.1,
        width: width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
              width: width * 0.5,
              child: Row(
                children: [
                  Image.asset('assets/food/burger.png'),
                  const Text(
                    'Junk food',
                    style: TextStyle(fontSize: 16, color: Colors.black26),
                  )
                ],
              ),
            ),
            const Text(
              'Burger mac beff',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text(
              '\$15.00',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(197, 48, 32, 1),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
