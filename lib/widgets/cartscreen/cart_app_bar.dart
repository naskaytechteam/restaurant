import 'package:flutter/material.dart';
import '../delay_screen.dart';
import '../shadow_icon.dart';

class CartAppBar extends StatelessWidget {
  final int delay;

  const CartAppBar({required this.delay, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return DelayScreen(
      delay: delay,
      child: SizedBox(
        height: height * 0.1,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ShadowIcon(
              iconClick: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios,
            ),
            Text(
              'Cart',
              style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.headline2?.fontFamily,
                  fontSize: 20),
            ),
            ShadowIcon(
              iconClick: () {},
              isImage: true,
              imageUrl: 'assets/images/hmenu.png',
            ),
          ],
        ),
      ),
    );
  }
}
