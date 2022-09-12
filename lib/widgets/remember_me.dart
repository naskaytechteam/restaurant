import 'package:flutter/material.dart';
class RememberMe extends StatefulWidget {

  const RememberMe({Key? key}) : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool rememberme = false;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    return SizedBox(
      height: height * 0.05,
      width: width * 0.5,
      child: Row(
        children: [
          Checkbox(
            value: rememberme,
            onChanged: (bool? value) {
              setState(() {
                rememberme = !rememberme;
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
          ),
          const Text(
            'Remember me',
          )
        ],
      ),
    );
  }
}
