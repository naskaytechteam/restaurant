import 'package:flutter/material.dart';

class FoodData extends StatelessWidget {
  final String foodImage;
  final String name;

  const FoodData({required this.foodImage, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Align(
        alignment: Alignment.centerLeft,
        child: Hero(
          transitionOnUserGestures: true,
          tag: name,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.01),
            height: height * 0.35,
            width: width * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(foodImage))),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.transparent,
                  child: Chip(
                    labelPadding: const EdgeInsets.only(right: 5),
                    label: const Text('Meat'),
                    avatar: Image.asset('assets/food/meet.png'),
                    backgroundColor: Colors.grey.shade200.withOpacity(0.6),
                  ),
                ),
                SizedBox(
                  height: height * 0.13,
                  width: width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      foodName(height, width,name),
                      favoriteButton(height, width)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget favoriteButton(double height, double width) {
    return Card(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          height: height * 0.045,
          width: width * 0.1,
          decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget foodName(double height, double width, String name) {
    return SizedBox(
      height: height * 0.11,
      width: width * 0.3,
      child: Column(
        children: [
          Container(
              height: height * 0.08,
              width: width * 0.3,
              alignment: Alignment.bottomLeft,
              child: Text(
                name,
                style:const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          const FittedBox(
            child: Text(
              '15 Min | 1 Serving',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
