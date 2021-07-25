import 'package:flutter/material.dart';

class CategoryTitleWidget extends StatelessWidget {
  final String title;
  final Function() onCloseProductList;

  const CategoryTitleWidget({
    Key? key,
    required this.title,
    required this.onCloseProductList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      color: Colors.pink.shade800,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onCloseProductList,
            iconSize: 40,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
