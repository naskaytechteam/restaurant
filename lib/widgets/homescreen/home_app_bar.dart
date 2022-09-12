import 'package:flutter/material.dart';
import 'package:restaurantapp/widgets/shadow_icon.dart';
import '../../config/colors.dart';
import '../../screen/cart.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ShadowIcon(
            iconClick: () {},
            isImage: true,
            imageUrl: 'assets/images/menu.png',
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Location',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
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
          ),
          ShadowIcon(
              iconClick: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const Cart();
                }));
              },
              icon: Icons.shopping_cart_outlined),
        ],
      ),
    );
  }
}
