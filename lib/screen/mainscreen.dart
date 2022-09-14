import 'package:flutter/material.dart';
import 'dart:developer';
import '/screen/bottom_nav_bar_screens/home.dart';
import '/screen/bottom_nav_bar_screens/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentBottomNavBarIndex = 0;
  final List<Widget> _bottomNavBarScrren=[
    const Home(),
    Container(),
    Container(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(index: _currentBottomNavBarIndex,children: _bottomNavBarScrren,),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:const Color.fromRGBO(238, 77, 42, 1),
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentBottomNavBarIndex = index;
              log(_currentBottomNavBarIndex.toString());
            });
          },
          currentIndex: _currentBottomNavBarIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        )
    );

  }
}
