import 'package:flutter/material.dart';
import '../cartscreen/order_price.dart';
import '../../config/colors.dart';
import '../delay_screen.dart';
import 'increase_order.dart';

class CartItem extends StatelessWidget {
  int delay;

  CartItem({required this.delay, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SizedBox(
      height: height * 0.7,
      width: width,
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount: 3,
          itemBuilder: (_, index) {
            return Align(
              alignment: Alignment.topCenter,
              child: DelayScreen(
                delay: index > 0 ? delay += 100 * index : delay += 100,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  height: height * 0.14,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 6),
                            blurRadius: 4),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: width * 0.1,
                        height: height * 0.1,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          fillColor: MaterialStateProperty.all(orangeColor),
                          value: true,
                          onChanged: (bool? value) {},
                        ),
                      ),
                      orderImage(height, width),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      const OrderPrice(),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      const IncreaseOrder(),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget orderImage(double height, double width) {
    return Container(
      height: height * 0.1,
      width: width * 0.2,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
    );
  }
}
