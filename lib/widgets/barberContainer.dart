import 'package:flutter/material.dart';

class BarberContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100]!,
            spreadRadius: 5.0,
            blurRadius: 5.0,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[100]!,
                  spreadRadius: 3.0,
                  blurRadius: 2.0,
                  offset: Offset(0, 1),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/image8.jpeg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jordan Coiffure Shop',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Services Offered: Haircut, Shave, Beard Trim',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Location: XYZ Street',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.bookmark,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
