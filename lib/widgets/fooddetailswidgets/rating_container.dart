import 'package:flutter/material.dart';

class RatingContainer extends StatelessWidget {
  final String foodName;
  final int totalItem;
  final VoidCallback increaseItemCount;
  final VoidCallback decreaseItemCount;

  const RatingContainer(
      {required this.foodName, required this.totalItem,
        required this.increaseItemCount,
        required this.decreaseItemCount,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      height: height * 0.1,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: height * 0.08,
            width: width * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily:
                          Theme.of(context).textTheme.headline2?.fontFamily),
                ),
                review(height, width),
              ],
            ),
          ),
          Container(
            height: height * 0.06,
            width: width * 0.3,
            decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                icon(Icons.add,increaseItemCount),
                Text(
                  totalItem.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                icon(Icons.remove,decreaseItemCount),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget icon(IconData iconData,VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Colors.white,
        child: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget review(double height, double width) {
    return SizedBox(
      height: height * 0.04,
      width: width * 0.5,
      // color: Colors.pink,
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          SizedBox(width: width * 0.01),
          const Text(
            '4.3',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          const Text('(342 Reviews)')
        ],
      ),
    );
  }
}
