import 'package:flutter/material.dart';

class DarkMode extends StatelessWidget {
  final bool switchValue; // Add this line

  const DarkMode({
    Key? key,
    required this.switchValue, // Add this line
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
              Icon(Icons.nightlight, size: 30),
              SizedBox(width: 15),
              Text(
                'Dark Mode',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Switch(
            value: switchValue,
            onChanged: (value) {},
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
