import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurantapp/widgets/fooddetailswidgets/ingredients.dart';
import '/models/food.dart';
import '/widgets/orderwidget.dart';
import '../../widgets/fooddetailswidgets/hero_image.dart';
import '../../widgets/fooddetailswidgets/item_description.dart';
import '../../widgets/fooddetailswidgets/rating_container.dart';

class FoodDetails extends StatefulWidget {
  final Food foodDetails;

  const FoodDetails({required this.foodDetails, Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  final TapGestureRecognizer _readMeGesture = TapGestureRecognizer();
  bool _readMore = false;
  int _totalItem = 1; // find better name

  @override
  void initState() {
    _readMeGesture.onTap = readMoreClick;
    super.initState();
  }

  @override
  void dispose() {
    _readMeGesture.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Size size = MediaQuery
        .of(context)
        .size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          HeroImage(
          heroTag: widget.foodDetails.foodName,
            foodImage: widget.foodDetails.foodImage,
          ),
          RatingContainer(
            foodName: widget.foodDetails.foodName,
            totalItem: _totalItem,
            increaseItemCount: increaseItem,
            decreaseItemCount: decreaseItem,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          ItemDescription(
            readMore: _readMore,
            foodDesc: widget.foodDetails.desc,
            tapGestureRecognizer: _readMeGesture,
          ),
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
                    Theme
                        .of(context)
                        .textTheme
                        .headline2
                        ?.fontFamily),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Ingredients(
              ingredientsUrl: widget.foodDetails.ingredients)
          //--
          ],
        ),
      ),
    ),
    bottomNavigationBar: OrderWidget(
    price: widget.foodDetails.price,
    buttonText: '+Add to cart',
    ),
    );
  }

  void readMoreClick() {
    setState(() {
      _readMore = !_readMore;
    });
  }

  void increaseItem() {
    setState(() {
      _totalItem++;
    });
  }

  void decreaseItem() {
    if (_totalItem > 1) {
      setState(() {
        _totalItem--;
      });
    }
  }
}
