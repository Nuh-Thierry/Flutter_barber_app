import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  UserProfileWidget({required this.imageUrl, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.blue[50],
              child: ClipOval(
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
