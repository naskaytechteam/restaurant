import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '/models/food.dart';
import '/widgets/homescreen/food_data.dart';
import '../../screen/food/food_details.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SizedBox(
      height: height * 0.4,
      width: width,
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection('restaurant').get(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;
            return Swiper(
              controller: SwiperController(),
              itemCount: querySnapshot.size,
              viewportFraction: 0.6,
              loop: false,
              scale: 0.8,
              onTap: (index) {
                QueryDocumentSnapshot doc = querySnapshot.docs[index];
                Food food = Food.fromJson(doc.data() as Map);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return FoodDetails(
                    foodDetails: food,
                  );
                }));
              },
              itemBuilder: (_, index) {
                QueryDocumentSnapshot doc = querySnapshot.docs[index];
                Food food = Food.fromJson(doc.data() as Map);
                return FoodData(
                  foodImage: food.foodImage,
                  name: food.foodName,
                );
              },
            );
          } else {
            return const Text('Something went wrong please restart your app');
          }
        },
      ),
    );
  }
}
