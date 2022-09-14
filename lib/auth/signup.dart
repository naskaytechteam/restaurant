import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screen/food/choose_favorite_food.dart';
import '../providers/authentication.dart';
import '../widgets/custom_elivated_button.dart';
import '../widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confPassword = TextEditingController();

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
              height: height * 0.03,
            ),
            CustomTextField(
                controller: _email,
                textFieldType: 'Email',
                textFieldText: 'Enter your Email..',
                icon: Icons.email_outlined),
            gapOfZeroPointFour(height),
            CustomTextField(
                controller: _password,
                textFieldType: 'Password',
                textFieldText: 'Enter your Password..',
                icon: Icons.lock),
            gapOfZeroPointFour(height),
            CustomTextField(
                controller: _confPassword,
                textFieldType: 'Confirm Password',
                textFieldText: 'Re-type your password..',
                icon: Icons.lock),
            SizedBox(
              height: height * 0.03,
            ),
            CustomElevatedButton(
              text: 'Sign Up',
              buttonClick: () => btnClick(context),
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
                  const Text('Already have an account '),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confPassword.dispose();
    log('controller are dispose successfully');
    super.dispose();
  }

  Widget gapOfZeroPointFour(double height) {
    return SizedBox(
      height: height * 0.04,
    );
  }

  void btnClick(BuildContext context) {
    Authentication authentication =
        Provider.of<Authentication>(context, listen: false);
    if (_email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _confPassword.text.isNotEmpty) {
      authentication.signUpWithEmail(_email.text, _password.text).then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return const ChooseFavoriteFood();
        }));

        log('new user signup successfully ');
      }).onError((error, stackTrace) {
        log('error in Firebase Signup(Firestore) $error');
      });
    } else {
      log('${_email.text} ${_password.text} ${_confPassword.text}');
      log('please fill all the details -> SignUp screen');
    }
  }
}
