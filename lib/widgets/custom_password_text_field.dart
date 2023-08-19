import 'package:flutter/material.dart';
import 'package:shop_app/consts.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final String text;
  final Function(String) onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;

  void _togglePasswordIcon() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      onChanged: widget.onChanged,
      enabled: true,
      style: TextStyle(
        color: textColor,
        fontSize: 18,
        fontFamily: 'Gilroy-Medium',
      ),
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Gilroy-Medium',
          color: textColor,
        ),
        constraints: const BoxConstraints(
          maxHeight: 80,
          minHeight: 80,
          maxWidth: double.infinity,
          minWidth: double.infinity,
        ),
        labelText: widget.text,
        labelStyle: TextStyle(
          color: textColor,
          fontFamily: 'Gilroy-Medium',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xff8D070F),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: color2,
            width: 2.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: color2,
            width: 1.0,
          ),
        ),
        prefixIcon: Icon(
          Icons.fingerprint,
          color: color2,
        ),
        suffixIcon: InkWell(
          onTap: () {
            _togglePasswordIcon();
          },
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: color2,
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
