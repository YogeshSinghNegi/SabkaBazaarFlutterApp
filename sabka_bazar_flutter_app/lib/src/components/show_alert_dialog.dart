import 'package:flutter/material.dart';

Future<void> showMyDialog(
  BuildContext context,
  String title,
  List<Widget> listWidget,
  List<Widget> actions,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: listWidget,
          ),
        ),
        actions: actions,
      );
    },
  );
}

/*
<Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
 */
