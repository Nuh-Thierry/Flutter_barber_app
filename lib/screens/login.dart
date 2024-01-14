import 'package:barber/screens/controller/loadingDialogue.dart';
import 'package:barber/screens/loginEmailPassword.dart';
import 'package:barber/screens/signUpScreen.dart';
import 'package:barber/widgets/LoginbuttonContainer.dart';
import 'package:barber/widgets/button_nav_bar.dart';
import 'package:barber/widgets/loginScreenContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 25,
              right: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 120,
                    backgroundImage: AssetImage('assets/images/login.jpg'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Let\'s you in',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                LoginContainer(
                  imagePath: 'assets/images/facebook.png',
                  text: 'Continue with Facebook',
                ),
                SizedBox(
                  height: 20,
                ),
                LoginContainer(
                  onPressed: () async {
                    await handleGoogleSignIn(context);
                  },
                  imagePath: 'assets/images/google.png',
                  text: 'Continue with Google',
                ),
                SizedBox(
                  height: 20,
                ),
                LoginContainer(
                  imagePath: 'assets/images/apple.png',
                  text: 'Continue with Apple',
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                LoginButtonConatiner(
                  hintText: 'Sign in with password',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginEmailPassword(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up.',
                          style: TextStyle(
                            color: Colors.blue,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleGoogleSignIn(BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialogue(message: 'Signing in with Google...');
        },
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the Google Sign-In
        return;
      }

      // Authenticate with Firebase using Google credentials
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Sign in with Firebase
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      // Check if the user already exists in your database
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(user!.uid).get();
      if (!userSnapshot.exists) {
        // If the user doesn't exist, create a new user in your database
        await _firestore.collection('users').doc(user.uid).set({
          'displayName': user.displayName,
          'email': user.email,
          // Add other user details as needed
        });
      }

      print(
          'Google Sign-In successful, navigating to CustomBottomNavigationBar');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNavigationBar()),
      );
    } catch (e) {
      // Handle errors here
      print('Error during Google Sign-In: $e');
    } finally {
      Navigator.of(context).pop(); // Close the dialog
    }
  }
}
