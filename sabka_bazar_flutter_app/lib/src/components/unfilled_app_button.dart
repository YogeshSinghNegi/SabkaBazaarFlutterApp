import 'package:flutter/material.dart';

class UnfilledAppButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  const UnfilledAppButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade800),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () => onPressed(),
      child: Text(buttonText),
    );
  }
}
