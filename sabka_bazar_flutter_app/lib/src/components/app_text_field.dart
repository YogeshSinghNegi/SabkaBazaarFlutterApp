import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isSecureText;
  final TextInputType keyboardType;

  const AppTextField({
    required this.labelText,
    required this.hintText,
    this.isSecureText = false,
    this.keyboardType = TextInputType.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: TextFormField(
        obscureText: isSecureText,
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(height: 1),
          hintStyle: TextStyle(height: 2),
        ),
      ),
    );
  }
}
