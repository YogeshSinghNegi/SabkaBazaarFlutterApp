import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final double borderRadius;
  final IconData buttonImage;
  final bool isImageOnly;

  const AppButton({
    this.buttonText = '',
    required this.onPressed,
    this.borderRadius = 0.0,
    this.buttonImage = Icons.remove,
    this.isImageOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade800),
      ),
      onPressed: () => onPressed(),
      child: _getChildWidget(),
    );
  }

  Widget _getChildWidget() {
    return isImageOnly
        ? Icon(
            buttonImage,
            color: Colors.white,
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(buttonText),
          );
  }
}
