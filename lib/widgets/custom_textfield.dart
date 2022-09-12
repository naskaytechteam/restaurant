import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String textFieldType;
  final String textFieldText;
  final IconData icon;
  final TextEditingController controller;
  const CustomTextField({required this.textFieldType,required this.controller,required this.textFieldText,required this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    return SizedBox(
      height: height * 0.05+height * 0.075,
      child: Column(
        children: [
        SizedBox(
        height: height * 0.05,
        width: width,
        child: Text(
          textFieldType,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Container(
        height: height * 0.075,
        width: width,
        padding: const EdgeInsets.all(2),
        alignment: Alignment.center,
        color: Colors.grey.shade200.withOpacity(0.8),
        child:  TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
              hintText: textFieldText,
              border: InputBorder.none),
        ),
      )
        ],
      ),
    );
  }
}
