import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final double leftPadding;
  final VoidCallback? onPressed;

  const LoginContainer({
    Key? key,
    required this.imagePath,
    required this.text,
    this.leftPadding = 60.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
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
        child: Padding(
          padding: EdgeInsets.only(left: leftPadding),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
                child: Image.asset(
                  imagePath,
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
