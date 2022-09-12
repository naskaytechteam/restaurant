import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurantapp/widgets/orderwidget.dart';
import '../../widgets/fooddetailswidgets/hero_image.dart';
import '../../widgets/fooddetailswidgets/item_description.dart';
import '../../widgets/fooddetailswidgets/rating_container.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeroImage(),
            const RatingContainer(),
            SizedBox(
              height: height * 0.03,
            ),
            const ItemDescription(),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: SizedBox(
                height: height * 0.05,
                width: width,
                child: Text(
                  'Ingredients',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily:
                          Theme.of(context).textTheme.headline2?.fontFamily),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.1,
              width: width,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Align(
                      child: Container(
                        height: height * 0.1,
                        width: width * 0.25,
                        color: const Color.fromRGBO(224, 228, 228, 1)
                            .withOpacity(0.6),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: const OrderWidget(
        buttonText: '+Add to cart',
      ),
    );
  }
}
