import 'package:flutter/material.dart';

import '../../config/colors.dart';

class CustomTabBar extends StatefulWidget  {
  const CustomTabBar({Key? key}) : super(key: key);


  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      height: height * 0.07,
      width: width,
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        isScrollable: true,
        indicatorColor: Colors.black,
        controller: TabController(length: 4, vsync: this),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
            color: orangeColor, borderRadius: BorderRadius.circular(25)),
        tabs: [
          tabs('recommended'),
          tabs('Junk food '),
          tabs('Vegan'),
          tabs('bre')
        ],
      ),
    );
  }

  Widget tabs(String text) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(text));
  }
}
