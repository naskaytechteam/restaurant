import 'package:flutter/material.dart';
import '/widgets/custom_app_bar.dart';
import '../../config/colors.dart';
import '../../screen/cart.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return CustomAppBar(
        firstIcon: Image.asset(
          'assets/images/menu.png',
          fit: BoxFit.cover,
        ),
        centerWidget:locationWidget(height, width) ,
        secondIcon: const Icon(
          Icons.shopping_cart_outlined,
          size: 20,
          color: Colors.black,
        ),
        firstIconClick: () {},
        secondIconClick: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_){
            return const Cart();
          }));
        });
  }
  Widget locationWidget(double height,double width){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Location',
          style:
          TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        SizedBox(
            height: height * 0.03,
            width: width * 0.4,
            child: Row(
              children: const [
                Icon(
                  Icons.location_on,
                  color: orangeColor,
                ),
                Text(
                  'Surakarta, INA',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ))
      ],
    );
  }
}
