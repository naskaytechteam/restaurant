import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/cartscreen/cart_app_bar.dart';
import '../widgets/cartscreen/cart_item.dart';
import '../widgets/delay_screen.dart';
import '../widgets/orderwidget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    int delay = 300;
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    // double width = size.width;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            CartAppBar(delay: delay),
            SizedBox(
              height: height * 0.03,
            ),
            CartItem(
              delay: delay,
            ),
          ],
        ),
        bottomNavigationBar: DelayScreen(
          delay: delay += 100,
          child: OrderWidget(
            buttonText: 'Check Out',
            height: height * 0.12,
            containerPadding:
                EdgeInsets.only(right: 22, left: 22, top: height * 0.02),
          ),
        ));
  }
}
