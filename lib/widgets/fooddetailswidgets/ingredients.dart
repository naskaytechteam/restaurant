import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final List ingredientsUrl;
  const Ingredients({required this.ingredientsUrl,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          scrollDirection: Axis.horizontal,
          itemCount: ingredientsUrl.length,
          itemBuilder: (_, index) {
            return Align(
              child: Container(
                height: height * 0.1,
                width: width * 0.25,
                padding: const EdgeInsets.all(9),
                color: const Color.fromRGBO(224, 228, 228, 1).withOpacity(0.6),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.network(ingredientsUrl[index]),
              ),
            );
          }),
    );
  }
}
