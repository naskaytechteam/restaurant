import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/widgets/custom_app_bar.dart';
import '../widgets/cartscreen/cart_item.dart';
import '../widgets/delay_screen.dart';
import '../widgets/orderwidget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
  bool _isCheckBoxSeleced = true;

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
            DelayScreen(
              delay: delay,
                child: CustomAppBar(
              firstIconClick: () {
                Navigator.of(context).pop();
              },
              secondIcon: Image.asset(
                'assets/images/hmenu.png',
                fit: BoxFit.cover,
              ),
              firstIcon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
              centerText: 'Cart',
              secondIconClick: () {},
            )),
            SizedBox(
              height: height * 0.03,
            ),
            CartItem(
              isCheckBoxSelected: _isCheckBoxSeleced,
              checkboxClick: (value) {
                setState(() {
                  _isCheckBoxSeleced = value;
                });
              },
              delay: delay,
            ),
          ],
        ),
        bottomNavigationBar: DelayScreen(
          delay: delay += 100,
          child: OrderWidget(
            price: 12,
            buttonText: 'Check Out',
            height: height * 0.12,
            containerPadding:
                EdgeInsets.only(right: 22, left: 22, top: height * 0.02),
          ),
        ));
  }
}
