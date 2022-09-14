import 'package:flutter/material.dart';
import '/widgets/homescreen/custom_swiper.dart';
import '/widgets/homescreen/custom_tabbar.dart';
import '/widgets/homescreen/home_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),

              const HomeAppBar(),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.1,
                width: width,
                color: Colors.red,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // (height, width),
              CustomTabBar(tickerProvider: this,),
              SizedBox(
                height: height * 0.03,
              ),
              const CustomSwiper()
            ],
          ),
        ),
      ),
    );
  }
}
