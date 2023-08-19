import 'package:flutter/material.dart';
import 'package:shop_app/consts.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomMainButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
      ),
      child: Container(
        width: 367,
        height: 67,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontFamily: "Gilroy-Reular",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
