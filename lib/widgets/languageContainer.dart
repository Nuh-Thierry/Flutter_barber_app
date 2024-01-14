import 'package:flutter/material.dart';

class LanguageContainer extends StatelessWidget {
  const LanguageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.language, size: 30),
              SizedBox(width: 15),
              Text(
                'Language',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'English USA',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
