import 'package:flutter/material.dart';

class LoginButtonConatiner extends StatelessWidget {
  final String hintText;
  final VoidCallback? onPressed;

  const LoginButtonConatiner({Key? key, required this.hintText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Center(
          child: Text(
            hintText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
