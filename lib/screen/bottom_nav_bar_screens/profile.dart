import 'package:flutter/material.dart';
import '/widgets/custom_app_bar.dart';
import '/screen/bottom_nav_bar_screens/edit_profile.dart';
import '/widgets/profilewidgets/customer_details.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          CustomAppBar(
              firstIcon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
              textSize: 27,
              centerText: 'Profile',
              secondIcon: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.black,
              ),
              firstIconClick: () {},
              secondIconClick: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return const EditProfile();
                }));
              }),
          SizedBox(height: height*0.02,),
          Container(
            height: height * 0.3,
            margin: EdgeInsets.symmetric(horizontal: width*0.03),
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(5, 5),
                      color: Colors.black26,
                      blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const CustomerDetails(),
                Container(
                  height: height * 0.28,
                  width: width * 0.4,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/second.png',
                          ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
