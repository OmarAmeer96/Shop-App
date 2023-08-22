import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar buildAppBar() {
  return AppBar(
    actions: [
      IconButton(
        icon: const Icon(
          FontAwesomeIcons.cartShopping,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text(
      "New Trend",
      style: TextStyle(
        fontFamily: "Gilroy-Bold",
        color: Colors.black,
      ),
    ),
    centerTitle: true,
  );
}
