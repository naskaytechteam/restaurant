import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final Function onTap;
  final String selectedChip;

  const CustomTabBar(
      {required this.onTap, required this.selectedChip, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      height: height * 0.07,
      width: width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          chips('Recommended'),
          SizedBox(
            width: width * 0.02,
          ),
          chips('Junk food'),
          SizedBox(
            width: width * 0.02,
          ),
          chips('Vegan'),
          SizedBox(
            width: width * 0.02,
          ),
          chips('Meat'),
        ],
      ),
    );
  }

  Widget chips(String name) {
    return InkWell(
        onTap: () => onTap(name),
        child: Chip(
            label: Text(
              name,
              style: TextStyle(
                  color: selectedChip == name ? Colors.white : Colors.black),
            ),
            backgroundColor: selectedChip == name
                ?const Color.fromRGBO(242, 76, 37, 1)
                : Colors.grey.shade50));
  }
}
