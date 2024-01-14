import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback? onPressed;

  const ProfileContainer({
    required this.icon,
    required this.name,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 30),
              SizedBox(width: 15),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          GestureDetector(
            onTap: onPressed,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
