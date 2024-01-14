import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final String? location;
  final String text;
  final VoidCallback onPressed;

  ButtonContainer({
    this.location,
    required this.text,
    required this.onPressed,
  }); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75, // Increased height
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.5),
      //       spreadRadius: 2,
      //       blurRadius: 5,
      //       offset: Offset(0, 2),
      //     ),
      //   ],
      // ),
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
