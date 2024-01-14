import 'package:flutter/material.dart';

class SignUpContainer extends StatelessWidget {
  final String imagePath;
  // Add a parameter for left padding

  const SignUpContainer({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
