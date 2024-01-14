import 'package:flutter/material.dart';

class ForgottenPasswordScreen extends StatelessWidget {
  const ForgottenPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 15,
          right: 15,
        ),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
