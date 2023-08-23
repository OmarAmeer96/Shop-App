import 'package:flutter/material.dart';
import 'package:shop_app/consts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    this.textType,
  });

  String hintText;
  String labelText;
  Function(String)? onChanged;
  TextInputType? textType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textType,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 23,
          horizontal: 12,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        label: Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
