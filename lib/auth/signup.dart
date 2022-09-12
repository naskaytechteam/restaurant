import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authentication.dart';
import '../widgets/custom_elivated_button.dart';
import '../widgets/custom_textfield.dart';

class SignUp extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confPassword = TextEditingController();

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        height: height * 0.8,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        width: width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Column(children: [
            gapOfZeroPointFour(height),
            SizedBox(
              height: height * 0.05,
              width: width,
              child: Text(
                'Welcome back!',
                style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.headline2?.fontFamily,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.05,
              width: width,
              child: const Text('See the list of likes of your food to order '),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextField(
                controller: email,
                textFieldType: 'Email',
                textFieldText: 'Enter your Email..',
                icon: Icons.email_outlined),

            gapOfZeroPointFour(height),
            CustomTextField(
                controller: password,
                textFieldType: 'Password',
                textFieldText: 'Enter your Password..',
                icon: Icons.lock),

            gapOfZeroPointFour(height),

            CustomTextField(
                controller: confPassword,
                textFieldType: 'Confirm Password',
                textFieldText: 'Re-type your password..',
                icon: Icons.lock),
            SizedBox(
              height: height * 0.03,
            ),
            CustomElevatedButton(
              text: 'Sugn Up',
              buttonClick: () => btnClick(context),
              backgroundColor: Colors.black,
            ),

            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.05,
              width: width,
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Already have an account '),
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget gapOfZeroPointFour(double height) {
    return SizedBox(
      height: height * 0.04,
    );
  }

  void btnClick(BuildContext context) {
    Authentication authentication =
        Provider.of<Authentication>(context, listen: false);
    if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confPassword.text.isNotEmpty) {
      authentication.signUpWithEmail(email.text, password.text);
    } else {
      log('${email.text} ${password.text} ${confPassword.text}');
      log('please fill all the details -> SignUp screen');
    }
  }

}
