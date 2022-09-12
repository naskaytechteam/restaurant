import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import '../providers/authentication.dart';
import '../screen/food/choose_favorite_food.dart';
import '../widgets/custom_elivated_button.dart';
import '../widgets/remember_me.dart';
import '../widgets/custom_textfield.dart';

class Login extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        height: height * 0.8,
        width: width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.07,
            ),
            SizedBox(
              height: height * 0.05,
              width: width,
              child: Text(
                'Welcome back!',
                style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.headline2?.fontFamily,
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
              height: height * 0.05,
            ),
            CustomTextField(
                controller: email,
                textFieldType: 'Email',
                textFieldText: 'Enter your Email..',
                icon: Icons.email_outlined),
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextField(
                controller: password,
                textFieldType: 'Password',
                textFieldText: 'Enter your password..',
                icon: Icons.lock),
            SizedBox(
              height: height * 0.05,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RememberMe(),
                  InkWell(
                    onTap: () {},
                    child: const Text('Forget Password',
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomElevatedButton(
              text: 'login',
              buttonClick: () => login(context),
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
                    TextSpan(text: 'Don\'t have an account?'),
                    TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    Authentication authentication =
        Provider.of<Authentication>(context, listen: false);
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      authentication.loginWithEmail(email.text, password.text).then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return const ChooseFavoriteFood();
        }));
      }).onError((error, stackTrace) {
        log('error');
      });
    } else {
      log('please enter all the login details');
    }
  }
}
