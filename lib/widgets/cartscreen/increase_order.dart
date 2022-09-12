import 'package:flutter/material.dart';
class IncreaseOrder extends StatelessWidget {
  const IncreaseOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return                       SizedBox(
      height: height * 0.1,
      width: width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey.shade200,
            child: const Icon(
              Icons.remove,
              color: Colors.black,
              size: 10,
            ),
          ),
          const Text(
            '1',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          const CircleAvatar(
            radius: 10,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 10,
            ),
          ),
        ],
      ),
    );
  }
}
