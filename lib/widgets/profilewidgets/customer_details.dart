import 'package:flutter/material.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      height: height * 0.3,
      width: width * 0.5,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: height * 0.05,
              width: width * 0.45,
              alignment: Alignment.topCenter,
              child: const FittedBox(
                child: Text(
                  'Kumar Kumar',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w900),
                ),
              )),

          Container(
              height: height * 0.04,
              width: width * .45,
              alignment: Alignment.center,
              child: const Text(
                'VijayVijay@gmail.com',
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: height * 0.06,
            width: width * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'Age :',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  '16',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.06,
            width: width * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'Gender :',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Male',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
