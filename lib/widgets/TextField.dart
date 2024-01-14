import 'package:flutter/material.dart';

class TextFieldEntry extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const TextFieldEntry({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<TextFieldEntry> createState() => _TextFieldEntryState();
}

class _TextFieldEntryState extends State<TextFieldEntry> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.suffixIcon != null ? !isPasswordVisible : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.grey,
        ),
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              )
            : null,
      ),
      style: TextStyle(fontSize: 18.0),
    );
  }
}
