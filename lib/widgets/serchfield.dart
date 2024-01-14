import 'package:flutter/material.dart';

class SearchFieldDelegate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: 'Search hairstyle',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none, // Set borderSide to none
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 14.0,
          //horizontal: 10.0,
        ),
        // prefixIcon: Icon(Icons.search),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 2.0,
            right: 4,
            top: 2,
            bottom: 2,
          ),
          child: Icon(
            Icons.menu_book,
            color: Colors.blue,
          ),
        ),
      ),
      style: TextStyle(fontSize: 18.0), // Adjust font size as needed
    );
  }
}
