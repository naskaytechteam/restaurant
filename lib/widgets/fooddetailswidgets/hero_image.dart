import 'package:flutter/material.dart';

import '../../screen/cart.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Hero(
      tag: '0',
      transitionOnUserGestures: true,
      child: Container(
        color: Colors.red,
        height: height * 0.47,
        width: width,
        padding: const EdgeInsets.only(top: 20),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: height * 0.07,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  //todo error when we remove material widget
                  color: Colors.grey.withOpacity(0.6),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.14,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Material(
                  //todo error-------------
                  color: Colors.grey.withOpacity(0.6),

                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const Cart();
                      }));
                    },
                    child: Container(
                        height: height * 0.07,
                        width: width * 0.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add_shopping_cart,
                          size: 20,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
