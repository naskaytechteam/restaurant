import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screen/mainscreen.dart';
import '/providers/authentication.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'dart:developer';
import '../bottom_nav_bar_screens/home.dart';

class ChooseFavoriteFood extends StatefulWidget {
  const ChooseFavoriteFood({Key? key}) : super(key: key);

  @override
  State<ChooseFavoriteFood> createState() => _ChooseFavoriteFoodState();
}

class _ChooseFavoriteFoodState extends State<ChooseFavoriteFood> {
  String? _foodName;
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                  width: width,
                ),
                SizedBox(
                  height: height * 0.1,
                  width: width,
                  child: const Text(
                    'Choose one your favorite food',
                    style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                _categoryRow(
                  _foodCategory(
                      foodName: 'Junk Food', image: 'assets/food/burger.png'),
                  _foodCategory(
                      foodName: 'Super Meat', image: 'assets/food/meet.png'),
                ),
                _categoryRow(
                  _foodCategory(
                      foodName: 'Oriantal Food',
                      image: 'assets/food/juice.png'),
                  _foodCategory(
                      foodName: 'Dessert', image: 'assets/food/coffee.png'),
                ),
                SizedBox(
                  height: height * 0.15,
                ),
                _swiper(height, width)
              ],
            ),
          )),
    );
  }

  Widget _foodCategory({required String foodName, required String image}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: _selected ? null : () => _addFavoriteFood(foodName),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: _foodName == foodName
                ? Colors.black26
                : Colors.grey.shade100.withOpacity(0.8),
            child: Image.asset(
              image,
            ),
          ),
        ),
        Text(
          foodName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Widget _categoryRow(Widget child1, Widget child2) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SizedBox(
      height: height * 0.23,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [child1, child2],
      ),
    );
  }

  void _addFavoriteFood(String foodName) {
    Authentication auth = Provider.of<Authentication>(context, listen: false);
    setState(() {
      _foodName = foodName;
      _selected = true;
    });
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        });
    log(foodName);
    auth.addFavoriteFood(foodName).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const MainScreen();
      }));
      log('add Favorite Food Successfully');
    }).onError((error, stackTrace) {
      log('error occurred in adding favorite food $error');
    });
  }

  Widget _swiper(double height, double width) {
    return SizedBox(
      width: width * 0.7,
      height: height * 0.1,
      child: SlideAction(
        sliderButtonIcon: const Icon(Icons.double_arrow_rounded),
        textStyle: const TextStyle(fontSize: 18, color: Colors.white),
        outerColor: Colors.black,
        child: const Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Text(
            'Swipe right to skip...',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        onSubmit: () {
          log('submitted');
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return const Home();
          }));
        },
      ),
    );
  }
}
