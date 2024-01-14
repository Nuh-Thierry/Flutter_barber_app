import 'package:barber/screens/controller/common_methond.dart';
import 'package:barber/screens/controller/loadingDialogue.dart';
import 'package:barber/screens/forgottenPassword.dart';
import 'package:barber/screens/signUpScreen.dart';
import 'package:barber/widgets/LoginbuttonContainer.dart';
import 'package:barber/widgets/TextField.dart';
import 'package:barber/widgets/button_nav_bar.dart';
import 'package:barber/widgets/signupContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginEmailPassword extends StatefulWidget {
  const LoginEmailPassword({super.key});

  @override
  State<LoginEmailPassword> createState() => _LoginEmailPasswordState();
}

class _LoginEmailPasswordState extends State<LoginEmailPassword> {
  TextEditingController lEmail = TextEditingController();
  TextEditingController lPassword = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkIfNetworkIsAvailable() {
    cMethods.checkConnectivity(context);

    loginFormValidation();
  }

  loginFormValidation() {
    if (!lEmail.text.trim().contains("@")) {
      cMethods.displaySnackBar('please enter correct email', context);
    } else if (lPassword.text.trim().length < 6) {
      cMethods.displaySnackBar(
          "password must be at least 6 characters ", context);
    } else {
      signInUser();
    }
  }

  signInUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDialogue(message: "Logging in..."),
    );

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: lEmail.text.trim(),
        password: lPassword.text.trim(),
      );

      final User? userFirebase = userCredential.user;

      if (!context.mounted) return;
      Navigator.pop(context);

      if (userFirebase != null) {
        final DatabaseReference usersRef = FirebaseDatabase.instance
            .ref()
            .child('users')
            .child(userFirebase.uid);

        usersRef.once().then((snap) {
          if (snap.snapshot.value != null) {
            if ((snap.snapshot.value as Map)['blockStatus'] == 'no') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomBottomNavigationBar(),
                ),
              );
            } else {
              FirebaseAuth.instance.signOut();
              cMethods.displaySnackBar(
                  "You are blocked. please contact admin", context);
            }
          } else {
            FirebaseAuth.instance.signOut();
            cMethods.displaySnackBar("Please sign up", context);
          }
        });
      }
    } catch (e) {
      Navigator.pop(context);
      cMethods.displaySnackBar("Error signing in. Please try again.", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 15,
          right: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Login to Your Account',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFieldEntry(
                hintText: 'Email',
                prefixIcon: Icons.email,
                controller: lEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldEntry(
                hintText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
                controller: lPassword,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 50,
              ),
              LoginButtonConatiner(
                hintText: 'Sign in',
                onPressed: () {
                  checkIfNetworkIsAvailable();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgottenPasswordScreen()));
                  },
                  child: Text(
                    "Forgotten Password",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Or continue with',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SignUpContainer(
                      imagePath: 'assets/images/facebook.png',
                    ),
                    SignUpContainer(
                      imagePath: 'assets/images/google.png',
                    ),
                    SignUpContainer(
                      imagePath: 'assets/images/apple.png',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: Colors.blue,
                          // decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
