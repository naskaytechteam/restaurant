import 'package:flutter/material.dart';

import '../../screen/cart.dart';

class HeroImage extends StatelessWidget {
  final String heroTag;
  final String foodImage;

  const HeroImage(
      {required this.heroTag,
      required this.foodImage,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Hero(
      tag: heroTag,
      transitionOnUserGestures: true,
      child: Container(

        height: height * 0.47,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(foodImage)
          )
        ),
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
                Card(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.14,
                      decoration: BoxDecoration(
                        color:Colors.grey.shade200.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
                Card(
                  color:Colors.transparent,
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
                          color: Colors.grey.shade200.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.add_shopping_cart,
                          size: 25,
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
