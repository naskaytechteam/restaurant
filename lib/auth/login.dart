import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import '../providers/authentication.dart';
import '../screen/food/choose_favorite_food.dart';
import '../widgets/custom_elivated_button.dart';
import '../widgets/remember_me.dart';
import '../widgets/custom_textfield.dart';

class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
                controller: _email,
                textFieldType: 'Email',
                textFieldText: 'Enter your Email..',
                icon: Icons.email_outlined),
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextField(
                controller: _password,
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account '),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('SignUp',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    Authentication authentication =
        Provider.of<Authentication>(context, listen: false);
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      authentication.loginWithEmail(_email.text, _password.text).then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return const ChooseFavoriteFood();
        }));

        log('user login successfully');
      }).onError((error, stackTrace) {
        log('error occurred in firebase login -> $error} ');
      });
    } else {
      log('please enter all the login details');
    }
  }
}
