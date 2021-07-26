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
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        elevation: MaterialStateProperty.all(3),
        shadowColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade800),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(buttonText),
      ),
    );
  }
}
