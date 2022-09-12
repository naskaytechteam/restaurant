//Login

/*
import 'package:flutter/material.dart';
import 'package:restaurantapp/auth/welcome.dart';
import 'package:restaurantapp/config/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      backgroundColor: welcomeBackgroundColor,
      primary: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Icon(Icons.cancel_outlined), Text('Later')],
                ),
              ),
              gap(height),
              Container(
                height: height * 0.05,
                width: width,
                alignment: Alignment.center,
                child: const Text(
                  'Login as an existing account',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              textField(height, width, 'Email Address'),
              SizedBox(
                height: height * 0.02,
              ),
              textField(height, width, 'Password'),
              gap(height),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                        return const Welcome();
                      }));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: orangeColor,
                  minimumSize: Size(width, height * 0.065),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily:
                      Theme.of(context).textTheme.headline1?.fontFamily),
                ),
              ),
              gap(height),
              SizedBox(
                height: height * 0.05,
                width: width,
                child: const Text(
                  'Create an account?',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.05, width: width,
                // child: ,
              ),
              loginWith('Continue with Google',
                  isImage: true, url: 'assets/images/google.png'),
              gap(height),
              loginWith('Continue with Facebook', icon: Icons.facebook),
              gap(height),
              loginWith(
                'Continue with Apple',
                icon: Icons.apple,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget loginWith(String loginText,
      {bool isImage = false, String? url, IconData? icon}) {
    return ListTile(
      leading: isImage
          ? Image.asset(
        url!,
        height: 27,
        width: 27,
        fit: BoxFit.cover,
      )
          : Icon(
        icon,
        size: 30,
      ),
      tileColor: Colors.white,
      title: Text(loginText),
    );
  }

  Widget textField(double height, double width, String hint) {
    return Container(
      color: Colors.white,
      height: height * 0.06,
      width: width,
      padding: EdgeInsets.only(left: width * 0.03),
      child: TextField(
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }

  Widget gap(double height) {
    return SizedBox(
      height: height * 0.03,
    );
  }
}

 */


    //    SIGNUP

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/config/colors.dart';
import 'package:restaurantapp/providers/authentication.dart';
import 'package:restaurantapp/widgets/login_with.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    Authentication authentication =
        Provider.of<Authentication>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          color: Colors.white.withOpacity(0.9),
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child:  Column(
            children: [
              gap(height),
              Container(
                height: height * 0.05,
                width: width,
                alignment: Alignment.center,
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              textField(height, width, 'Email Address', email),
              SizedBox(
                height: height * 0.02,
              ),
              textField(height, width, 'Password', password),
              gap(height),
              textField(height, width, 'Confirm Password', confPassword),
              gap(height),
              ElevatedButton(
                onPressed: () {
                  if (email.text.isNotEmpty &&
                      password.text.isNotEmpty &&
                      confPassword.text.isNotEmpty &&
                      password.text == confPassword.text) {
                    authentication.signUpWithEmail(email.text, password.text);
                  }
                },
                //  2263741773782814
                //
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: orangeColor,
                  minimumSize: Size(width, height * 0.065),
                ),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily:
                          Theme.of(context).textTheme.headline1?.fontFamily),
                ),
              ),
              gap(height),
              SizedBox(
                height: height * 0.05,
                width: width,
                child: const Text(
                  'Already have an account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              SizedBox(
                height: height * 0.05, width: width,
                // child: ,
              ),
              const LoginWith(
                  loginText: 'Continue with Google',
                  isImage: true,
                  login: Login.google,
                  url: 'assets/images/google.png'),
              gap(height),
              const LoginWith(
                  loginText: 'Continue with Facebook',
                  login: Login.facebook,
                  icon: Icons.facebook),
              gap(height),
              const LoginWith(
                loginText: 'Continue with Apple',
                login: Login.apple,
                icon: Icons.apple,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(double height, double width, String hint,
      TextEditingController controller) {
    return Container(
      color: Colors.white,
      height: height * 0.06,
      width: width,
      padding: EdgeInsets.only(left: width * 0.03),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }

  Widget gap(double height) {
    return SizedBox(
      height: height * 0.03,
    );
  }
}

 */