import 'package:flutter/material.dart';
import '/auth/signup.dart';
import '/widgets/custom_elivated_button.dart';
import 'login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 23, 43, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.5,
                width: width,
                child: Image.asset(
                  'assets/images/delivery.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height * 0.15,
                width: width,
                child: const Text(
                  'The experience of buying food quickly',
                  style: TextStyle(
                    fontSize: 33,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.05,
                width: width,
                child: const Text(
                  'The experience of buying food quickly',
                  style: TextStyle(color: Colors.white70, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomElevatedButton(
                  buttonClick: () => buttonClick('signup'),
                  fontFamily: Theme.of(context).textTheme.headline2?.fontFamily,
                  text: 'Sign Up',
                  backgroundColor: const Color.fromRGBO(238, 77, 42, 1)),
              SizedBox(
                height: height * 0.03,
              ),
              CustomElevatedButton(
                  buttonClick: () => buttonClick('Login'),
                  text: 'Login',
                  textColor: Colors.black,
                  fontFamily: Theme.of(context).textTheme.headline2?.fontFamily,
                  backgroundColor: const Color.fromRGBO(215, 217, 219, 1))
            ],
          ),
        ),
      ),
    );
  }

  void buttonClick(String text) {
    showBottomSheet(
        transitionAnimationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 900)),
        enableDrag: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return text == 'Login' ?const Login() :const SignUp();
        });
  }
}
