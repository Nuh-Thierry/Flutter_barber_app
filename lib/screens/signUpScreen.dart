import 'package:barber/screens/controller/common_methond.dart';
import 'package:barber/screens/controller/loadingDialogue.dart';
import 'package:barber/screens/login.dart';
import 'package:barber/widgets/LoginbuttonContainer.dart';
import 'package:barber/widgets/TextField.dart';
import 'package:barber/widgets/signupContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkIfNetworkIsAvailable() {
    cMethods.checkConnectivity(context);

    signUpFormValidation();
  }

  signUpFormValidation() {
    if (!emailController.text.trim().contains("@")) {
      cMethods.displaySnackBar('please enter correct email', context);
    } else if (passwordController.text.trim().length < 6) {
      cMethods.displaySnackBar(
          "password must be atleast 6 characters ", context);
    } else if (nameController.text.trim().length < 3) {
      cMethods.displaySnackBar(
          "your name must be atleast four or more characters", context);
    } else if (phoneController.text.trim().length < 8) {
      cMethods.displaySnackBar(
          "phone number must be atleast 8 characters", context);
    } else if (genderController.text.trim().isEmpty) {
      cMethods.displaySnackBar("please enter gender", context);
    } else {
      //signup user
      registerNewUser();
    }
  }

  Future<void> registerNewUser() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            LoadingDialogue(message: "Registration in progress..."),
      );
      final User? userFirebase =
          (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ))
              .user;
      if (!context.mounted) return;
      Navigator.pop(context);

      final DatabaseReference usersRef = FirebaseDatabase.instance
          .ref()
          .child('users')
          .child(userFirebase!.uid);

      final Map<String, dynamic> userDataMap = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'gender': genderController.text.trim(),
        'id': userFirebase.uid,
        'blockStatus': 'no',
      };

      usersRef.update(userDataMap);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        cMethods.displaySnackBar(e.toString(), context);
      }
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
                height: 30,
              ),
              Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldEntry(
                hintText: 'Email',
                prefixIcon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldEntry(
                hintText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
                controller: passwordController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldEntry(
                hintText: 'Name',
                prefixIcon: Icons.person,
                controller: nameController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldEntry(
                hintText: 'Number',
                prefixIcon: Icons.phone,
                controller: phoneController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldEntry(
                hintText: 'Gender',
                prefixIcon: Icons.transgender,
                controller: genderController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 30,
              ),
              LoginButtonConatiner(
                onPressed: () {
                  checkIfNetworkIsAvailable();
                },
                hintText: 'SignUp',
              ),
              SizedBox(
                height: 20,
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
                height: 40,
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
                        text: 'Sign in.',
                        style: TextStyle(
                          color: Colors.blue,
                          // decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
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
