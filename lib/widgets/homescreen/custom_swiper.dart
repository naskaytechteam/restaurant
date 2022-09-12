import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../screen/food/food_details.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      color: Colors.black,
      height: height * 0.4,
      width: width,
      child: Swiper(
        controller: SwiperController(),
        itemCount: 5,
        viewportFraction: 0.6,
        loop: false,
        scale: 0.8,
        onTap: (index) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const FoodDetails();
          }));
        },
        itemBuilder: (_, index) {
          return Align(
              alignment: Alignment.centerLeft,
              child: Hero(
                transitionOnUserGestures: true,
                tag: '$index',
                child: Container(
                  height: height * 0.35,
                  width: width * 0.6,
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ));
        },
      ),
    );
  }
}
